import 'package:http/http.dart' as http;

class Firestore {
  /// [apiKey] the key that is used to authenticate requests
  late final String apiKey;

  /// [client] the http client to be used for this API. It is being passed in for testability.
  late final http.Client _client;

  Firestore._();

  static late final Firestore _instance;

  static Firestore get instance {
    return _instance;
  }

  factory Firestore.init({required String withApiKey, required http.Client client}) {
    _instance = Firestore._();
    _instance._client = client;
    _instance.apiKey = withApiKey;
    return instance;
  }
}

Map<String, dynamic> expandJson(Map<String, dynamic> json) {
  json.forEach((key, value) {
    print(value.runtimeType);
  });
  return {};
}
