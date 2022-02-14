// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document()
  ..ref = json['name'] as String
  ..createTime = DateTime.parse(json['createTime'] as String)
  ..updateTime = DateTime.parse(json['updateTime'] as String)
  ..jsonData = Document._flattenJson(json['fields'] as Map<String, dynamic>);

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'name': instance.ref,
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
      'fields': instance.jsonData,
    };
