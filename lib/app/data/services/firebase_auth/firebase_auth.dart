// https://stackoverflow.com/questions/37322747/using-mail-and-password-to-authenticate-via-the-rest-api-firebase

import 'package:http/http.dart' as http;
import 'package:stack_answers_lite/app/config/firebase.dart';
import 'package:stack_answers_lite/app/data/services/firebase_auth/auth_request.dart';
import 'package:stack_answers_lite/app/models/users/user.dart';

import 'api_helper.dart';

class FirebaseAuth {
  late final http.Client client;

  FirebaseAuth({required this.client});

  Future<User?> signup({required AuthRequest userRequest}) async {
    Map<String, String> headers = {"Content-Type": 'application/json'};
    dynamic response = ApiHelper.post(
        headers: headers,
        url: 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=${FirebaseConfig.apiKey}',
        param: userRequest.toJson());
    User user = User(email: response.email, id: response.localId);
    return user;
  }

  // todo implement
  // Future<User> login(){}
  // Future<Void> refreshAuthToken(){}
}
