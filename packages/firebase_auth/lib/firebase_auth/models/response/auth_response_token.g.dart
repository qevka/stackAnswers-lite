// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseToken _$AuthResponseTokenFromJson(Map<String, dynamic> json) =>
    AuthResponseToken(
      json['access_token'] as String,
      json['expires_in'] as String,
      json['token_type'] as String,
      json['refresh_token'] as String,
      json['id_token'] as String,
      json['user_id'] as String,
      json['project_id'] as String,
    );

Map<String, dynamic> _$AuthResponseTokenToJson(AuthResponseToken instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'expires_in': instance.expires_in,
      'token_type': instance.token_type,
      'refresh_token': instance.refresh_token,
      'id_token': instance.id_token,
      'user_id': instance.userId,
      'project_id': instance.project_id,
    };
