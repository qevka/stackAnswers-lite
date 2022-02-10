// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      askedBy: json['askedBy'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      id: json['id'] as String?,
      question: json['question'] as String,
      solved: json['solved'] as bool? ?? false,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'askedBy': instance.askedBy,
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'question': instance.question,
      'solved': instance.solved,
    };
