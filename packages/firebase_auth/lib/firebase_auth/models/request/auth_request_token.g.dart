// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequestToken _$AuthRequestTokenFromJson(Map<String, dynamic> json) =>
    AuthRequestToken(
      grant_type: json['grant_type'] as String? ?? "refresh_token",
      refresh_token: json['refresh_token'] as String,
    );

Map<String, dynamic> _$AuthRequestTokenToJson(AuthRequestToken instance) =>
    <String, dynamic>{
      'grant_type': instance.grant_type,
      'refresh_token': instance.refresh_token,
    };
