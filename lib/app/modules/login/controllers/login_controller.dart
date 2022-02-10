import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stack_answers_lite/app/data/services/firebase_auth/auth_models.dart';
import 'package:stack_answers_lite/app/data/services/firebase_auth/firebase_auth.dart';
import 'package:stack_answers_lite/app/models/users/user.dart';

class LoginController extends GetxController {
  Rx<int> logoPosition = Rx<int>(-100);
  //TODO: Implement LoginController
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  @override
  onReady() {
    super.onReady();
    logoPosition.value = (Get.height / 2 - 300).toInt();
  }

  Future<String?> loginUser(LoginData data) async {
    // try {
    //   // call Signin API here
    //   }
    // } catch (e) {
    //   return "login failed";
    // }
    return "Login complete!";
  }

  Future<String?> signupUser(SignupData data) async {
    final auth = FirebaseAuth(client: http.Client());
    AuthRequest request = AuthRequest(email: data.name!, password: data.password!);
    try {
      User? user = await auth.signup(userRequest: request);
      print(user!.toJson());
    } catch (e) {
      print(e);
      return "login failed";
    }
    return 'User registration complete!';
  }

  Future<String?> recoverPassword(String name) async {
    return "";
    // TODO implement password reset here
  }

  Future<String?> signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
}
