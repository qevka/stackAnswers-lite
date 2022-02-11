// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

import 'auth_response.dart';

part 'auth_response_token.g.dart';

@JsonSerializable()
class AuthResponseToken {
  final String access_token;
  final String expires_in;
  final String token_type;
  final String refresh_token;
  final String id_token;
  @JsonKey(name: "user_id")
  final String userId;
  final String project_id;

  AuthResponseToken(
      this.access_token, this.expires_in, this.token_type, this.refresh_token, this.id_token, this.userId, this.project_id);

  factory AuthResponseToken.fromJson(Map<String, dynamic> json) => _$AuthResponseTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseTokenToJson(this);

  AuthResponse toAuthResponse({required String email}) {
    return AuthResponse(
        idToken: id_token,
        refreshToken: refresh_token,
        registered: null,
        userId: userId,
        email: email,
        expiresIn: expires_in);
  }
}
