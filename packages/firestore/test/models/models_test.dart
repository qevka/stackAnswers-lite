import 'dart:convert';
import 'dart:io';

import 'package:firestore/models/primitives/document.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Firestore data", () {
    test("expand data to match firestore requirements", () {});
    test("Flatten firestore data to meet requirements", () async {
      final data = File('packages/firestore/test/models/test_data/doc_structure.json');
      final json = jsonDecode(await data.readAsString());
      final flatData = File('packages/firestore/test/models/test_data/flat_doc.json');
      final flatJson = jsonDecode(await flatData.readAsString());
      final Document doc = Document.fromJson(json);
      expect(doc.toJson(), flatJson);
    });
  });
}
