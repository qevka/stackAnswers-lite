// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      comment: json['comment'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'comment': instance.comment,
      'date': instance.date.toIso8601String(),
      'id': instance.id,
    };
