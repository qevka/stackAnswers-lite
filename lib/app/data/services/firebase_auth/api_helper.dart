import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'auth_models.dart';

class ApiHelper {
  static Future<dynamic> post({required String url, Map? param, Map<String, String>? headers}) async {
    dynamic response;
    try {
      var client = http.Client();
      final rawResponse = await client.post(Uri.parse(url), body: jsonEncode(param), headers: headers);
      response = _response(rawResponse);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return response;
  }

  static dynamic _response(http.Response response) {
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode >= 400 && response.statusCode <= 499) {
      throw AuthErrorResponse.fromJson(jsonDecode(response.body));
    }
  }
}
