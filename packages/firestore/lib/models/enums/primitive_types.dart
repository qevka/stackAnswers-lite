import 'dart:core';

enum FireTypes {
  stringValue,
  arrayValue,
  booleanValue,
  timestampValue,
  referenceValue,
  doubleValue,
  intValue,
  integerValue,
  mapValue
}

extension PrimEx on FireTypes {
  static FireTypes tryParse({required String value}) {
    var val = _fromRawType[value];
    assert(val != null, "This type needs to be added to the types string map");
    return val!;
  }

  String get stringVal {
    var val = _stringVal[this];
    assert(val != null, "This type needs to be added to the types string map");
    return val!;
  }
}

final Map<FireTypes, String> _stringVal = {
  FireTypes.stringValue: "stringValue",
  FireTypes.arrayValue: "arrayValue",
  FireTypes.booleanValue: "booleanValue",
  FireTypes.timestampValue: "timestampValue",
  FireTypes.referenceValue: "referenceValue",
  FireTypes.doubleValue: "doubleValue",
  FireTypes.intValue: "intValue",
  FireTypes.integerValue: "integerValue",
  FireTypes.mapValue: "mapValue"
};

final Map<String, FireTypes> _fromRawType = {
  "int": FireTypes.integerValue,
  "bool": FireTypes.booleanValue,
  "_InternalLinkedHashMap<String, dynamic>": FireTypes.mapValue,
  "List<dynamic>": FireTypes.arrayValue,
  "String": FireTypes.stringValue,
  "double": FireTypes.doubleValue
};
