import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth/api_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_helper_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("ApiHelper Test", () {
    test("post", () async {
      FirebaseAuth.init(withApiKey: '1234');
      final client = MockClient();
      final helper = ApiHelper(client: client);
      final authData = File('packages/firebase_auth/test/test_data/auth_response_login.json');
      String authJson = await authData.readAsString();
      final passwordResetData = File('packages/firebase_auth/test/test_data/auth_response_password_reset.json');
      String passJson = await authData.readAsString();
      const login = 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=1234';
      const resetPass = 'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=1234';
      const refreshToken = 'https://securetoken.googleapis.com/v1/token?key=1234';
      // login
      when(client.post(Uri.parse(login))).thenAnswer((_) async => http.Response(authJson, 200));
      expect(helper.post(url: refreshToken), authJson);
      when(client.post(Uri.parse(resetPass))).thenAnswer((_) async => http.Response(passJson, 404));
      expect(helper.post(url: refreshToken), isA<AuthErrorResponse>());
      // // reset Password
      // when(client.post(Uri.parse(resetPass))).thenAnswer((_) async => http.Response(passJson, 200));
      // // refresh Token
      // when(client.post(Uri.parse(refreshToken))).thenAnswer((_) async => http.Response(authJson, 200));
    });
  });
}
