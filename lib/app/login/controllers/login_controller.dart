import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

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
    // try {
    //   // call signup api here
    //   }
    // } catch (e) {
    //   return "login failed";
    // }
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
