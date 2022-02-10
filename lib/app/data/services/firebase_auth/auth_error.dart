import 'package:json_annotation/json_annotation.dart';

part 'auth_error.g.dart';

@JsonSerializable()
class AuthError {
  /// [message] The error message
  final AuthErrorMessage message;

  /// [domain] The domain of the error
  final String domain;

  /// [reason] The reason for the error
  final String reason;

  AuthError(this.message, this.domain, this.reason);

  factory AuthError.fromJson(Map<String, dynamic> json) => _$AuthErrorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthErrorToJson(this);
}

/// [AuthErrorMessage] An enum representing most of the possible errors.
enum AuthErrorMessage {
  // ignore: constant_identifier_names
  EMAIL_EXISTS,
  // ignore: constant_identifier_names
  OPERATION_NOT_ALLOWED,
  // ignore: constant_identifier_names
  TOO_MANY_ATTEMPTS_TRY_LATER,
  // ignore: constant_identifier_names
  EMAIL_NOT_FOUND,
  // ignore: constant_identifier_names
  INVALID_PASSWORD,
  // ignore: constant_identifier_names
  USER_DISABLED
}
