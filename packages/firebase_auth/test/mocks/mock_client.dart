import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {
  @override
  Future<http.Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    switch (url.path) {
      case 'login':
        var authData = File('packages/firebase_auth/test/test_data/auth_response_login.json');
        var authJson = jsonDecode(await authData.readAsString());
        return http.Response(jsonEncode(authJson), 200);
      case 'loginError':
        var authData = File('packages/firebase_auth/test/test_data/auth_error_response.json');
        var authJson = jsonDecode(await authData.readAsString());
        return http.Response(jsonEncode(authJson), 400);
      case 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=1234':
        var authData = File('packages/firebase_auth/test/test_data/auth_response_login.json');
        var authJson = jsonDecode(await authData.readAsString());
        return http.Response(jsonEncode(authJson), 200);
      default:
        var authData = File('packages/firebase_auth/test/test_data/auth_response_login.json');
        var authJson = jsonDecode(await authData.readAsString());
        return http.Response(jsonEncode(authJson), 200);
    }
  }
}
