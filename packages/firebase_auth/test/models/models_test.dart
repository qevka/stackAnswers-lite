import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth/models/auth_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("firebase Models", () {
    test("user", () async {
      final userData = File('packages/firebase_auth/test/test_data/user.json');
      final userJson = jsonDecode(await userData.readAsString());
      final User user = User.fromJson(userJson);
      expect(user.email, "test@gmail.com");
      expect(user.toJson(), userJson);
    });

    test("AuthResponseLogin", () async {
      final authData = File('packages/firebase_auth/test/test_data/auth_response_login.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthResponseLogin auth = AuthResponseLogin.fromJson(authJson);
      expect(auth.userId, "vPljq5bVCPQXpqWaKhcENJR7bgv2");
      expect(auth.toJson(), authJson);
    });

    test("AuthRequest", () async {
      final authData = File('packages/firebase_auth/test/test_data/auth_request.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthRequest auth = AuthRequest.fromJson(authJson);
      expect(auth.email, "test@teest.com");
      expect(auth.toJson(), authJson);
    });

    test("AuthError", () async {
      final authData = File('packages/firebase_auth/test/test_data/auth_error.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthError auth = AuthError.fromJson(authJson);
      expect(auth.message, AuthErrorMessage.EMAIL_NOT_FOUND);
      expect(auth.toJson(), authJson);
    });

    test("AuthErrorResponse", () async {
      final authData = File('packages/firebase_auth/test/test_data/auth_error_response.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthErrorResponse auth = AuthErrorResponse.fromJson(authJson['error']);
      // expect(auth.code, 400);
      // expect(auth.toJson(), authJson);
    });

    test("AuthRequestToken", () async {
      final authData = File('packages/firebase_auth/test/test_data/auth_request_token.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthRequestToken auth = AuthRequestToken.fromJson(authJson);
      expect(auth.refresh_token,
          "AIwUaOmDR-tdK6JaAogdWPds3dIuAk8ZYCPiFm3XZWGdvxdE1YfM3EOazFH7X4xoXeCPdEq5gERNsvjbJpArNuS3wbL19vXPBUKprWFcqMVjEzysXE9sszT0NcF93PMGydqe1aArC6XZOC80T7rvdJATYqyJjkBKjIxJgeVbvYO0Kgf6GcSclw7cjrEQQAGaZfMjF9NwJnZ1rJ9XfYsdYhUWTADWrdt41g");
      expect(auth.toJson(), authJson);
    });

    test("TokenResponse", () async {
      final authData = File('packages/firebase_auth/test/test_data/token_response.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthResponseToken auth = AuthResponseToken.fromJson(authJson);
      expect(auth.userId, "vPljq5bVCPQXpqWaKhcENJR7bgv2");
      expect(auth.toJson(), authJson);
    });

    test("TokenResponse", () async {
      final authData = File('packages/firebase_auth/test/test_data/auth_response_password_reset.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthResponsePasswordReset auth = AuthResponsePasswordReset.fromJson(authJson);
      expect(auth.email, "support@qevka.com");
      expect(auth.toJson(), authJson);
    });
  });
}
