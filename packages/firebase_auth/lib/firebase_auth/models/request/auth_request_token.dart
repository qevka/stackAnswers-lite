// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'auth_request_token.g.dart';

@JsonSerializable()
class AuthRequestToken {
  final String grant_type;
  final String refresh_token;

  AuthRequestToken({this.grant_type = "refresh_token", required this.refresh_token});

  factory AuthRequestToken.fromJson(Map<String, dynamic> json) => _$AuthRequestTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRequestTokenToJson(this);
}
