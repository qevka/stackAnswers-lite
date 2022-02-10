import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  /// [accepted] Indicates if the user who posed the question accepted this solution or not.
  final bool accepted;

  /// [date] The date the answer was given
  late final DateTime date;

  /// [downVotes] The number of people that found this solution to be wrong.
  final int downVotes;

  /// [id] The unique id of this Answer (used for lookups)
  late final String id;

  /// [answer] The answer
  final String answer;

  /// [upVotes] This value indicates how many people found this solution useful.
  final int upVotes;

  Answer({required this.accepted, DateTime? date, this.downVotes = 0, String? id, required this.answer, this.upVotes = 0}) {
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

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
