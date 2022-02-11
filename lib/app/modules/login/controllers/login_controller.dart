import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<int> logoPosition = Rx<int>(-100);
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

  Future<String?> signupUser(SignupData data) async {}

  Future<String?> recoverPassword(String name) async {}

  Future<String?> signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
}
