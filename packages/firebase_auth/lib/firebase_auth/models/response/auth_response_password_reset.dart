import 'package:json_annotation/json_annotation.dart';

part 'auth_response_password_reset.g.dart';

@JsonSerializable()
class AuthResponsePasswordReset {
  String kind;
  String email;

  AuthResponsePasswordReset({required this.email, required this.kind});

  factory AuthResponsePasswordReset.fromJson(Map<String, dynamic> json) => _$AuthResponsePasswordResetFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponsePasswordResetToJson(this);
}
