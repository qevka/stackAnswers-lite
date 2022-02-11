// https://stackoverflow.com/questions/37322747/using-mail-and-password-to-authenticate-via-the-rest-api-firebase
import 'dart:convert';

import 'package:firebase_auth/firebase_auth/models/auth_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import 'firebase_auth/api_helper.dart';
import 'firebase_auth/models/request/auth_request_token.dart';

export 'firebase_auth/models/auth_models.dart';

class FirebaseAuth {
  /// [apiKey] the key that is used to authenticate requests
  late final String apiKey;

  /// [client] the http client to be used for this API. It is being passed in for testability.
  final http.Client _client = http.Client();

  /// [currentUser] The currently signed in user.
  late final User? currentUser;

  /// [authCredentials] The credentials of the currently signed in user this can be used to refresh auth tokens and
  /// authorize REST API calls.
  late final AuthResponse? authCredentials;

  final BehaviorSubject<User> _authUserSubject = BehaviorSubject<User>();

  FirebaseAuth._();

  static late final FirebaseAuth _instance;

  static FirebaseAuth get instance {
    return _instance;
  }

  factory FirebaseAuth.init({required String withApiKey}) {
    _instance = FirebaseAuth._();
    _instance.apiKey = withApiKey;
    return instance;
  }

  /// [signup] this function registers a new user in firebase and returns an AuthResponse which includes tokens needed
  /// for future requests and also user IDs for looking up documents.
  static Future<User?> signup({required AuthRequest userRequest}) async {
    Map<String, String> headers = {"Content-Type": 'application/json'};
    dynamic response;
    try {
      response = await ApiHelper(client: instance._client).post(
          headers: headers,
          url: 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=${instance.apiKey}',
          param: userRequest.toJson());
    } on AuthErrorResponse catch (e, stacktrace) {
      debugPrint(e.toJson().toString() + stacktrace.toString());
      rethrow;
    }
    AuthResponse authResponse = AuthResponse.fromJson(response);
    // Update the current user
    instance.currentUser = authResponse.toUser();
    // Emit a new user in the users stream
    instance._authUserSubject.add(instance.currentUser!);
    // Store the credentials to disk. This makes grabbing the refresh token easy if needed.
    GetStorage box = GetStorage();
    box.write('credentials', jsonEncode(authResponse.toJson()));
    _instance.authCredentials = authResponse;
    return instance.currentUser;
  }

  /// [login] This function logs a user in and returns an AuthResponse which includes tokens needed
  /// for future requests and also user IDs for looking up documents.
  static Future<User?> login({required AuthRequest userRequest}) async {
    Map<String, String> headers = {"Content-Type": 'application/json'};
    dynamic response = await ApiHelper(client: instance._client).post(
        headers: headers,
        url: 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=${instance.apiKey}',
        param: userRequest.toJson());
    AuthResponse authResponse = AuthResponse.fromJson(response);
    // Update current user
    instance.currentUser = authResponse.toUser();
    // Emit a new user in the users stream
    instance._authUserSubject.add(instance.currentUser!);
    // Store the credentials to disk. This makes grabbing the refresh token easy if needed.
    GetStorage box = GetStorage();
    // Set the local credentials to the newly fetched ones.
    _instance.authCredentials = authResponse;
    box.write('credentials', jsonEncode(authResponse.toJson()));
    return instance.currentUser;
  }

  // Todo use this function when invalid/expired token exception is thrown.
  static Future<void> refreshTokens() async {
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
      response = await ApiHelper(client: instance._client).post(
          headers: headers,
          url: 'https://securetoken.googleapis.com/v1/token?key=${instance.apiKey}',
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
