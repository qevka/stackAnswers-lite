// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthErrorResponse _$AuthErrorResponseFromJson(Map<String, dynamic> json) =>
    AuthErrorResponse(
      json['code'] as int,
      $enumDecode(_$AuthErrorMessageEnumMap, json['message']),
      (json['errors'] as List<dynamic>)
          .map((e) => AuthError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuthErrorResponseToJson(AuthErrorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': _$AuthErrorMessageEnumMap[instance.message],
      'errors': instance.errors.map((e) => e.toJson()).toList(),
    };

const _$AuthErrorMessageEnumMap = {
  AuthErrorMessage.EMAIL_EXISTS: 'EMAIL_EXISTS',
  AuthErrorMessage.OPERATION_NOT_ALLOWED: 'OPERATION_NOT_ALLOWED',
  AuthErrorMessage.TOO_MANY_ATTEMPTS_TRY_LATER: 'TOO_MANY_ATTEMPTS_TRY_LATER',
  AuthErrorMessage.EMAIL_NOT_FOUND: 'EMAIL_NOT_FOUND',
  AuthErrorMessage.INVALID_PASSWORD: 'INVALID_PASSWORD',
  AuthErrorMessage.USER_DISABLED: 'USER_DISABLED',
};
