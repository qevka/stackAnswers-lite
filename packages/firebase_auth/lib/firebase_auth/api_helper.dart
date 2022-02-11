import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'models/auth_models.dart';

/// This class is for processing the initial requests to the rest API. It takes the url, and params and returns a response
/// that is either Json data or a thrown exception. This is the base class and no serialization should happen here. (in the _response
/// function we are serializing the AuthErrorResponse but in the future we will make this class more generic to handle all API errors.
/// and return relevant data back to the top level API handler.
class ApiHelper {
  final http.Client _client;

  ApiHelper({required http.Client client}) : _client = client;

  /// [post]
  /// @url the raw url of the end point.
  /// @param the query params that will be passed into the request as a map
  /// @headers The request headers that can be used for setting the content type ect..
  Future<dynamic> post({required String url, Map? param, Map<String, String>? headers}) async {
    dynamic response;
    try {
      final rawResponse = await _client.post(Uri.parse(url), body: jsonEncode(param), headers: headers);
      response = _response(rawResponse);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return response;
  }

  /// [get] a http get request wrapper
  Future<dynamic> get({required String url, Map<String, String>? headers}) async {
    dynamic response;
    try {
      final rawResponse = await _client.get(Uri.parse(url), headers: headers);
      response = _response(rawResponse);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return response;
  }

  /// [delete] A http delete request wrapper
  Future<dynamic> delete({required String url, Map? param, Map<String, String>? headers}) async {
    dynamic response;
    try {
      final rawResponse = await _client.delete(Uri.parse(url), body: jsonEncode(param), headers: headers);
      response = _response(rawResponse);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return response;
  }

  /// This function processes the resulting raw http data and returns it as json or throws it as an AuthErrorReponse.
  dynamic _response(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var responseJson = jsonDecode(response.body);
      return responseJson;
    } else if (response.statusCode >= 400 && response.statusCode <= 499) {
      //Todo make this class more extensible to handle REST API calls to firestore as well.
      throw AuthErrorResponse.fromJson(jsonDecode(response.body));
    }
  }
}
