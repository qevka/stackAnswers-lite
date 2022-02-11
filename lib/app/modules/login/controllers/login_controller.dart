import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:stack_answers_lite/app/routes/app_pages.dart';

class LoginController extends GetxController {
  Rx<int> logoPosition = Rx<int>(-100);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  @override
  onReady() {
    super.onReady();
    logoPosition.value = (Get.height / 2 - 300).toInt();
  }

  Future<String?> loginUser(LoginData data) async {
    AuthRequest authRequest = AuthRequest(email: data.name, password: data.password);
    try {
      await FirebaseAuth.login(userRequest: authRequest);
      if (FirebaseAuth.instance.currentUser != null) {
        Get.toNamed(Routes.home);
      }
    } on AuthErrorResponse catch (e) {
      debugPrint(e.message.toString());
      return e.message.toString();
    }
    return "Login complete!";
  }

  Future<String?> signupUser(SignupData data) async {
    AuthRequest authRequest = AuthRequest(email: data.name!, password: data.password!);
    try {
      await FirebaseAuth.signup(userRequest: authRequest);
      if (FirebaseAuth.instance.currentUser != null) {
        Get.toNamed(Routes.home);
      }
    } on AuthErrorResponse catch (e) {
      debugPrint(e.message.toString());
      return e.message.toString();
    }
    return "Login complete!";
  }

  Future<String?> recoverPassword(String name) async {}

  Future<String?> signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
}
