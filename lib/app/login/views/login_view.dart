import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:seed_deck/app/modules/login/controllers/login_controller.dart';
import 'package:seed_deck/app/routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          FlutterLogin(
            theme: LoginTheme(primaryColor: Colors.blue),
            title: "SeedDeck",
            titleTag: "title",
            navigateBackAfterRecovery: true,
            onConfirmRecover: controller.signupConfirm,
            loginAfterSignUp: true,
            initialAuthMode: AuthMode.login,
            userValidator: (value) {
              if (!value!.contains('@') || !value.endsWith('.com')) {
                return "Email must contain '@' and end with '.com'";
              }
              return null;
            },
            passwordValidator: (value) {
              if (value!.isEmpty) {
                return 'Password is empty';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            onLogin: (loginData) {
              return controller.loginUser(loginData);
            },
            onSignup: (signupData) {
              return controller.signupUser(signupData);
            },
            onSubmitAnimationCompleted: () {
              if (FirebaseAuth.instance.currentUser != null) {
                Get.toNamed(Routes.home);
              }
            },
            onRecoverPassword: (name) {
              return controller.recoverPassword(name);
              // Show new password dialog
            },
          ),
          Obx(() {
            return AnimatedPositioned(
              curve: Curves.bounceIn,
              duration: Duration(milliseconds: 1450),
              top: controller.logoPosition.value.toDouble(),
              child: Text(
                "🍅",
                style: TextStyle(fontSize: 60),
              ),
            );
          }),
        ],
      ),
    );
  }
}
