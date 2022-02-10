import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  /// [askedBy] The email address of the person posing the question
  final String askedBy;

  /// [date] The date the question was asked
  late final DateTime date;

  /// [id] The unique id of this Question (used for lookups)
  late final String id;

  /// [question] The question
  final String question;

  /// [solved] Indicates if a solution has been accepted by the user who asked the question
  final bool solved;

  Question({required this.askedBy, DateTime? date, String? id, required this.question, this.solved = false}) {
    if (id == null) {
      // if creating on the client generate ID
      this.id = Uuid().v4();
    } else {
      // if pulling from server populate the ID
      this.id = id;
    }
    if (date == null) {
      this.date = DateTime.now();
    } else {
      this.date = date;
    }
  }

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
