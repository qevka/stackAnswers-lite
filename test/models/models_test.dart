import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stack_answers_lite/app/models/models.dart';

void main() {
  group("models", () {
    test("question", () async {
      final questionData = File('test/test_data/question.json');
      final questionJson = jsonDecode(await questionData.readAsString());
      final Question question = Question.fromJson(questionJson);
      expect(question.question, "what is the meaning of life");
      expect(question.toJson(), questionJson);
    });

    test("answer", () async {
      final answerData = File('test/test_data/answer.json');
      final answerJson = jsonDecode(await answerData.readAsString());
      final Answer answer = Answer.fromJson(answerJson);
      expect(answer.answer, "try adding a semi colon");
      expect(answer.toJson(), answerJson);
    });

    test("comment", () async {
      final commentData = File('test/test_data/comment.json');
      final commentJson = jsonDecode(await commentData.readAsString());
      final Comment comment = Comment.fromJson(commentJson);
      expect(comment.comment, "sounds like a good solution to me!");
      expect(comment.toJson(), commentJson);
    });
  });
}
