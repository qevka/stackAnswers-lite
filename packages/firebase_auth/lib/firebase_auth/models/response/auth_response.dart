import 'package:json_annotation/json_annotation.dart';

import '../auth_models.dart';

part 'auth_response.g.dart';

/// {
/// "kind": "identitytoolkit#VerifyPasswordResponse",
/// "localId": "vPljq5bVCPQXpqWaKhcENJR7bgv2",
/// "email": "test@teest.com",
/// "displayName": "",
/// "idToken": "eyJhbGciOiJSUzI1NiIsImtpZCI6ImYyNGYzMTQ4MTk3ZWNlYTUyOTE3YzNmMTgzOGFiNWQ0ODg3ZWEwNzYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc3RhY2thbnN3ZXJzLWxpdGUiLCJhdWQiOiJzdGFja2Fuc3dlcnMtbGl0ZSIsImF1dGhfdGltZSI6MTY0NDQ3MzA1MSwidXNlcl9pZCI6InZQbGpxNWJWQ1BRWHBxV2FLaGNFTkpSN2JndjIiLCJzdWIiOiJ2UGxqcTViVkNQUVhwcVdhS2hjRU5KUjdiZ3YyIiwiaWF0IjoxNjQ0NDczMDUxLCJleHAiOjE2NDQ0NzY2NTEsImVtYWlsIjoidGVzdEB0ZWVzdC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsidGVzdEB0ZWVzdC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.Z319ngeRdr_ZvRty4HUlVR6daWqY5XRfE2ZVBejRWqwpLNzLo5wUdj7MTTvkzx4nKVyJkJ7k5uw3UQpVdtUUbHTrbGLSOc7OQioQco4Yzc5L3k2S4aVPZM_QxcY01TtelXNuiTuDm9y6FjpHWqGb3UYKmPs9WWZW3Bu9yU1DKIJVHxZxE_lKeWGmO9-0GmkBKpWl2YtLq50xT8EsUf8WjU4Y7IJ7qixIqU8K5lrAxQnOiq8rCsCWcUDE_7raVy5EGNdWXI0mw77EcMCd9-rEUuu8VhsmZemzLZ_aaGH5r0UX5EvDDqyz0DdOfA6vR4A8cbps0y06A4vgtwbPMh1Srw",
/// "registered": true,
/// "refreshToken": "AIwUaOlgPZ9U2x8lq2J8Xab_-mpWmXj03bVpIzSKWHN1wGWMB2HMAJY6M70nqUzD54V1y4voOm5CFomcoc72jC51s1ze-D1zxNVsgbZHs5rHrsIu1uEfLgDIdHNX5e6xGKMGeg5gcYAo8-l5NLWsHadBbmewW5baDNwvPdtDgyp9wIfXfAN084pND7Fjk_scp6hGfZxw8SF1AaBTnN_T4ypyGthjqwtaAw",
/// "expiresIn": "3600"
/// }
/// [AuthResponse] Above is the json structure of this class. The class is instantiated when making
/// authentication requests to the firebase auth REST API.
@JsonSerializable()
class AuthResponse {
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

  AuthResponse(
      {this.kind,
      required this.userId,
      required this.email,
      this.displayName,
      required this.idToken,
      this.registered,
      required this.refreshToken,
      required this.expiresIn});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  User toUser() {
    return User(email: email, id: userId);
  }
}
