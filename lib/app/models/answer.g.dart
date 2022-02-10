// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      accepted: json['accepted'] as bool,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      downVotes: json['downVotes'] as int? ?? 0,
      id: json['id'] as String?,
      answer: json['answer'] as String,
      upVotes: json['upVotes'] as int? ?? 0,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'accepted': instance.accepted,
      'date': instance.date.toIso8601String(),
      'downVotes': instance.downVotes,
      'id': instance.id,
      'answer': instance.answer,
      'upVotes': instance.upVotes,
    };
