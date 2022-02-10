import 'package:json_annotation/json_annotation.dart';

import 'auth_error.dart';

part 'auth_error_response.g.dart';

@JsonSerializable(explicitToJson: true)

/// [AuthErrorResponse] If the request fails this is the response you will get from the Auth Rest API.
class AuthErrorResponse {
  /// [code] The status code of the http request
  final int code;

  /// [message] The name of the error
  final AuthErrorMessage message;

  /// [errors] A list of resulting AuthError(s)
  final List<AuthError> errors;

  AuthErrorResponse(this.code, this.message, this.errors);

  factory AuthErrorResponse.fromJson(Map<String, dynamic> json) => _$AuthErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthErrorResponseToJson(this);
}
