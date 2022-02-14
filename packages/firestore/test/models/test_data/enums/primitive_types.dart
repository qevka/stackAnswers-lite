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
  FireTypes tryParse({required String value}) {
    var val = _types[value];
    assert(val != null, "This type needs to be added to the types string map");
    return val!;
  }
}

final Map<String, FireTypes> _types = {
  "stringValue": FireTypes.stringValue,
  "arrayValue": FireTypes.arrayValue,
  "booleanValue": FireTypes.booleanValue,
  "timestampValue": FireTypes.timestampValue,
  "referenceValue": FireTypes.referenceValue,
  "doubleValue": FireTypes.doubleValue,
  "intValue": FireTypes.intValue,
  "integerValue": FireTypes.integerValue,
  "mapValue": FireTypes.mapValue
};
