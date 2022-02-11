// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthError _$AuthErrorFromJson(Map<String, dynamic> json) => AuthError(
      $enumDecode(_$AuthErrorMessageEnumMap, json['message']),
      json['domain'] as String,
      json['reason'] as String,
    );

Map<String, dynamic> _$AuthErrorToJson(AuthError instance) => <String, dynamic>{
      'message': _$AuthErrorMessageEnumMap[instance.message],
      'domain': instance.domain,
      'reason': instance.reason,
    };

const _$AuthErrorMessageEnumMap = {
  AuthErrorMessage.EMAIL_EXISTS: 'EMAIL_EXISTS',
  AuthErrorMessage.OPERATION_NOT_ALLOWED: 'OPERATION_NOT_ALLOWED',
  AuthErrorMessage.TOO_MANY_ATTEMPTS_TRY_LATER: 'TOO_MANY_ATTEMPTS_TRY_LATER',
  AuthErrorMessage.EMAIL_NOT_FOUND: 'EMAIL_NOT_FOUND',
  AuthErrorMessage.INVALID_PASSWORD: 'INVALID_PASSWORD',
  AuthErrorMessage.USER_DISABLED: 'USER_DISABLED',
};
