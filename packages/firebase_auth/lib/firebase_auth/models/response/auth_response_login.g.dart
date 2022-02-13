// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseLogin _$AuthResponseLoginFromJson(Map<String, dynamic> json) =>
    AuthResponseLogin(
      kind: json['kind'] as String?,
      userId: json['localId'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      idToken: json['idToken'] as String,
      registered: json['registered'] as bool?,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as String,
    );

Map<String, dynamic> _$AuthResponseLoginToJson(AuthResponseLogin instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'localId': instance.userId,
      'email': instance.email,
      'displayName': instance.displayName,
      'idToken': instance.idToken,
      'registered': instance.registered,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
    };
