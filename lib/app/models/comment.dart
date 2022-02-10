import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  /// [comment] The comment
  final String comment;

  /// [date] The date the comment was made
  late final DateTime date;

  /// [id] The unique id of this Comment (used for lookups)
  late final String id;

  Comment({DateTime? date, required this.comment, String? id}) {
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

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
