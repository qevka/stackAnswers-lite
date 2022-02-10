// https://stackoverflow.com/questions/37322747/using-mail-and-password-to-authenticate-via-the-rest-api-firebase
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stack_answers_lite/app/config/firebase.dart';
import 'package:stack_answers_lite/app/data/services/firebase_auth/auth_request.dart';
import 'package:stack_answers_lite/app/data/services/firebase_auth/auth_response.dart';
import 'package:stack_answers_lite/app/models/users/user.dart';

class FirebaseAuth {
  late final http.Client client;

  FirebaseAuth({required this.client});

  Future<User> signup({required AuthRequest userRequest}) async {
    final rawResponse = await client.post(
        Uri.parse('https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=${FirebaseConfig.apiKey}'),
        body: userRequest.toJson(),
        headers: {"Content-Type": "application/json"});
    final responseJson = jsonDecode(rawResponse.body);
    AuthResponse response = AuthResponse.fromJson(responseJson);
    //todo handle any errors here.
    User user = User(email: response.email, id: response.localId);
    return user;
  }

  // todo implement
  // Future<User> login(){}
  // Future<Void> refreshAuthToken(){}
}
