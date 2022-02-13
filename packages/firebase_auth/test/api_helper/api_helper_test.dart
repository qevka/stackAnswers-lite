import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth/api_helper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_client.dart';

void main() {
  var client = MockClient();
  var helper = ApiHelper(client: client);
  FirebaseAuth.init(withApiKey: '1234', client: client);
  group("API_HELPER", () {
    test("When error returned then throws AuthErrorResponse", () async {
      // Use mockito to mock an http request's response

      expect(() async => await helper.post(url: 'loginError'), throwsA(isA<AuthErrorResponse>()));
    });

    test("When successful response returns http.Response with status code of 200", () async {
      var response = await helper.post(url: 'login');
      expect(response.statusCode, 200);
    });
  });

  group("Firebase Auth", () {
    test("when signup called and response is successful", () async {
      AuthRequest userRequest = AuthRequest(email: "test@teest.com", password: "1234");
      User? user = await FirebaseAuth.signup(userRequest: userRequest);
      expect(user?.email, "test@teest.com");
      // expect(user.id, "vPljq5bVCPQXpqWaKhcENJR7bgv2");
    });
  });
}
