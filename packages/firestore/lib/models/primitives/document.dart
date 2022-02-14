import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable(explicitToJson: true)
class Document {
  /// [ref] The document reference that can be used to lookup this document in firebase.
  @JsonKey(name: "name")
  late final String ref;

  /// [createTime] The time that this document was created.
  late final DateTime createTime;

  /// [updateTime] The time when this document was last updated.
  late final DateTime updateTime;

  /// [jsonData] The data that is included in this document.
  @JsonKey(name: "fields", fromJson: _flattenJson)
  late final Map<String, dynamic> jsonData;

  Document();

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  static Map<String, dynamic> _flattenJson(Map<String, dynamic> messyJson) {
    Map<String, dynamic> cleanJson = {};
    // This should handle everything except list and map
    messyJson.forEach((key, value) {
      value.forEach((key2, value2) {
        if (key2 == "mapValue") {
          cleanJson[key] = _mapHandler(value2);
        } else if (key2 == "arrayValue") {
          cleanJson[key] = _listHandler(value2);
        } else {
          cleanJson[key] = value2;
        }
      });
    });
    return cleanJson;
  }

  static List<dynamic> _listHandler(Map<String, dynamic> messyJson) {
    List<dynamic> cleanJson = [];
    messyJson['values'].forEach((value) {
      cleanJson.add(value[value.keys.first]);
    });
    return cleanJson;
  }

  static Map<String, dynamic> _mapHandler(Map<String, dynamic> messyJson) {
    Map<String, dynamic> cleanJson = {};
    messyJson['fields'].forEach((key, value) {
      value.forEach((key2, value2) {
        cleanJson[key] = value2;
      });
    });
    return cleanJson;
  }
}
