import 'package:http/http.dart' as http;

import 'models/enums/primitive_types.dart';

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

  static Map<String, dynamic> expandJson(Map<String, dynamic> json) {
    Map<String, dynamic> messyJson = {};
    json.forEach((key, value) {
      FireTypes type = PrimEx.tryParse(value: value.runtimeType.toString());
      if (type == FireTypes.arrayValue) {
        messyJson[key] = {
          FireTypes.arrayValue.stringVal: {'values': _expandList(value)}
        };
      } else if (type == FireTypes.mapValue) {
        Map<String, dynamic> map = _expandMap(value);
        messyJson[key] = {
          FireTypes.mapValue.stringVal: {"fields": map}
        };
      } else {
        messyJson[key] = typeWiseMatcher(key, value);
      }
    });
    return messyJson;
  }
}

Map<String, dynamic> typeWiseMatcher(String key, dynamic value) {
  Map<String, dynamic> nestedJson = {};
  dynamic mutatedValue = value;
  var keyVal = PrimEx.tryParse(value: key.runtimeType.toString()).stringVal;
  switch (PrimEx.tryParse(value: key.runtimeType.toString())) {
    case FireTypes.booleanValue:
      mutatedValue = value == "true" ? true : false;
      break;
    case FireTypes.doubleValue:
      mutatedValue = double.parse(value);
      break;
    case FireTypes.integerValue:
      mutatedValue = int.parse(value);
      break;
    case FireTypes.stringValue:
      RegExp dateMatcher = RegExp(r"\b[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z\b");
      if (dateMatcher.hasMatch(value.toString())) keyVal = FireTypes.timestampValue.stringVal;
      mutatedValue = value.toString();
      break;
    default:
  }
  nestedJson[keyVal] = mutatedValue;
  return nestedJson;
}

List<dynamic> _expandList(List<dynamic> list) {
  List<dynamic> newList = [];
  for (var element in list) {
    newList.add(typeWiseMatcher(element, element));
  }
  return newList;
}

Map<String, dynamic> _expandMap(Map<String, dynamic> json) {
  Map<String, dynamic> messyJson = {};
  json.forEach((key, value) {
    messyJson[key] = typeWiseMatcher(key, value);
  });
  return messyJson;
}
