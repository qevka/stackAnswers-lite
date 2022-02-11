// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_password_reset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponsePasswordReset _$AuthResponsePasswordResetFromJson(
        Map<String, dynamic> json) =>
    AuthResponsePasswordReset(
      email: json['email'] as String,
      kind: json['kind'] as String,
    );

Map<String, dynamic> _$AuthResponsePasswordResetToJson(
        AuthResponsePasswordReset instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'email': instance.email,
    };
