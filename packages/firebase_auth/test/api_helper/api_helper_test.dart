import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth/api_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_helper_test.mocks.dart';

/// What I want to test here
/// when a user sends a request to the server I want to mock the response so I can test it reliably
/// Send Email password -> return a success response and test that it outputs the correct error types
/// Send signup password and email -> make sure responses are handled.

@GenerateMocks([], customMocks: [MockSpec<http.Client>(as: #MockClient, returnNullOnMissingStub: true)])
void main() {
  group("ApiHelper Test", () {
    test("post", () async {
      FirebaseAuth.init(withApiKey: '1234');
      final client = MockClient();
      final helper = ApiHelper(client: client);
      final authData = File('packages/firebase_auth/test/test_data/auth_response_login.json');
      String authJson = await authData.readAsString();
      final authErrorData = File('packages/firebase_auth/test/test_data/auth_error_response.json');
      String authError = await authErrorData.readAsString();

      const login = 'login';
      const error = 'error';

      // when(client.post(Uri.parse(login), headers: null, body: null, encoding: null))
      //     .thenAnswer((_) async => http.Response(authJson, 200));
      when(client.post(Uri.parse(error))).thenAnswer((_) async => http.Response(authError, 400));
      var data = await helper.post(url: error);

      expect(data.body, isA<AuthErrorResponse>());
      reset(client);
    });
  });
}
