// https://stackoverflow.com/questions/37322747/using-mail-and-password-to-authenticate-via-the-rest-api-firebase
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:stack_answers_lite/app/config/firebase.dart';
import 'package:stack_answers_lite/app/data/services/firebase_auth/models/auth_models.dart';
import 'package:stack_answers_lite/app/data/services/firebase_auth/models/request/auth_request.dart';
import 'package:stack_answers_lite/app/data/services/firebase_auth/models/response/auth_response_token.dart';
import 'package:stack_answers_lite/app/models/users/user.dart';

import 'api_helper.dart';
import 'models/request/auth_request_token.dart';

class FirebaseAuth {
  /// [client] the http client to be used for this API. It is being passed in for testability.
  final http.Client _client = http.Client();

  /// [_instance] The pointer to the singleton instance of FirebaseAuth
  static final FirebaseAuth _instance = FirebaseAuth._();

  /// [currentUser] The currently signed in user.
  late final User currentUser;

  /// [authCredentials] The credentials of the currently signed in user this can be used to refresh auth tokens and
  /// authorize REST API calls.
  late final AuthResponse authCredentials;

  final BehaviorSubject<User> _authUserSubject = BehaviorSubject<User>();

  FirebaseAuth._();

  factory FirebaseAuth() {
    return _instance;
  }

  /// [signup] this function registers a new user in firebase and returns an AuthResponse which includes tokens needed
  /// for future requests and also user IDs for looking up documents.
  Future<User?> signup({required AuthRequest userRequest}) async {
    Map<String, String> headers = {"Content-Type": 'application/json'};
    dynamic response;
    try {
      response = await ApiHelper(client: _client).post(
          headers: headers,
          url: 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=${FirebaseConfig.apiKey}',
          param: userRequest.toJson());
    } on AuthErrorResponse catch (e, stacktrace) {
      debugPrint(e.toJson().toString() + stacktrace.toString());
      rethrow;
    }
    AuthResponse authResponse = AuthResponse.fromJson(response);
    // Update the current user
    currentUser = authResponse.toUser();
    // Emit a new user in the users stream
    _authUserSubject.add(currentUser);
    // Store the credentials to disk. This makes grabbing the refresh token easy if needed.
    GetStorage box = GetStorage();
    box.write('credentials', jsonEncode(authResponse.toJson()));
    _instance.authCredentials = authResponse;
    return currentUser;
  }

  /// [login] This function logs a user in and returns an AuthResponse which includes tokens needed
  /// for future requests and also user IDs for looking up documents.
  Future<User?> login({required AuthRequest userRequest}) async {
    Map<String, String> headers = {"Content-Type": 'application/json'};
    dynamic response = ApiHelper(client: _client).post(
        headers: headers,
        url: 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=${FirebaseConfig.apiKey}',
        param: userRequest.toJson());
    AuthResponse authResponse = AuthResponse.fromJson(response);
    // Update current user
    currentUser = authResponse.toUser();
    // Emit a new user in the users stream
    _authUserSubject.add(currentUser);
    // Store the credentials to disk. This makes grabbing the refresh token easy if needed.
    GetStorage box = GetStorage();
    // Set the local credentials to the newly fetched ones.
    _instance.authCredentials = authResponse;
    box.write('credentials', jsonEncode(authResponse.toJson()));
    return currentUser;
  }

  // Todo use this function when invalid/expired token exception is thrown.
  Future<void> refreshTokens() async {
    GetStorage box = GetStorage();
    // look up credentials from disk.
    String jsonData = box.read('credentials');
    // turn them into a AuthResponse Object
    AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(jsonData));
    // Turn the response into a RequestToken
    AuthRequestToken requestToken = AuthRequestToken(refresh_token: authResponse.refreshToken);
    Map<String, String> headers = {"Content-Type": 'application/json'};
    dynamic response;
    // Send the request
    try {
      response = ApiHelper(client: _client).post(
          headers: headers,
          url: 'https://securetoken.googleapis.com/v1/token?key=${FirebaseConfig.apiKey}',
          param: requestToken.toJson());
    } on AuthErrorResponse catch (e, stacktrace) {
      debugPrint(e.toString() + stacktrace.toString());
      rethrow;
    }
    AuthResponseToken responseToken = AuthResponseToken.fromJson(response);
    // now that we have the token we need to update the credentials and store it.
    AuthResponse newCred = responseToken.toAuthResponse(email: authResponse.email);
    _instance.authCredentials = newCred;
    box.write('credentials', jsonEncode(newCred.toJson()));
  }
}
