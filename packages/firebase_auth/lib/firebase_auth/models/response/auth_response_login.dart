import 'package:json_annotation/json_annotation.dart';

import '../auth_models.dart';

part 'auth_response_login.g.dart';

/// [AuthResponseLogin] Above is the json structure of this class. The class is instantiated when making
/// authentication requests to the firebase auth REST API.
@JsonSerializable()
class AuthResponseLogin {
  /// [kind] identifies the type of resource being returned from the server
  /// ex. for signing up a new user the result is "identitytoolkit#SignupNewUserResponse"
  /// or for logging in the result is "identitytoolkit#VerifyPasswordResponse"
  final String? kind;

  /// [localId] This will be used as the user ID to uniquely identify users.
  @JsonKey(name: "localId")
  final String userId;

  /// [email] The email of the user making the auth request
  final String email;

  /// [displayName] The name of the user (if using google sign in this meta data is included).
  final String? displayName;

  /// [idToken] This is the authToken to be used in database queries ect.. working with the database.
  final String idToken;

  /// [registered] A bool determining if the user was successfully registered yet or not.
  final bool? registered;

  /// [refreshToken] Should probably be cached on the clients device. Firebase ID tokens are short lived
  /// and last for an hour; the refresh token can be used to retrieve new ID tokens. Refresh tokens expire
  /// only when one of the following occurs: The user is deleted. The user is disabled.
  final String refreshToken;

  /// [expiresIn] The amount of time until the token expires: 3600 seconds = 1 hour
  final String expiresIn;

  AuthResponseLogin(
      {this.kind,
      required this.userId,
      required this.email,
      this.displayName,
      required this.idToken,
      this.registered,
      required this.refreshToken,
      required this.expiresIn});

  factory AuthResponseLogin.fromJson(Map<String, dynamic> json) => _$AuthResponseLoginFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseLoginToJson(this);

  User toUser() {
    return User(email: email, id: userId);
  }
}
