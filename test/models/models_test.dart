import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stack_answers_lite/app/data/services/firebase_auth/authModels.dart';
import 'package:stack_answers_lite/app/models/models.dart';

void main() {
  group("models", () {
    test("user", () async {
      final userData = File('test/test_data/user.json');
      final userJson = jsonDecode(await userData.readAsString());
      final User user = User.fromJson(userJson);
      expect(user.email, "test@gmail.com");
      expect(user.toJson(), userJson);
    });

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

  group("firebase Models", () {
    test("AuthResponse", () async {
      final authData = File('test/test_data/auth_response.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthResponse auth = AuthResponse.fromJson(authJson);
      expect(auth.localId, "vPljq5bVCPQXpqWaKhcENJR7bgv2");
      expect(auth.toJson(), authJson);
    });

    test("AuthRequest", () async {
      final authData = File('test/test_data/auth_request.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthRequest auth = AuthRequest.fromJson(authJson);
      expect(auth.email, "test@teest.com");
      expect(auth.toJson(), authJson);
    });

    test("AuthError", () async {
      final authData = File('test/test_data/auth_error.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthError auth = AuthError.fromJson(authJson);
      expect(auth.message, AuthErrorMessage.EMAIL_NOT_FOUND);
      expect(auth.toJson(), authJson);
    });

    test("AuthErrorResponse", () async {
      final authData = File('test/test_data/auth_error_response.json');
      final authJson = jsonDecode(await authData.readAsString());
      final AuthErrorResponse auth = AuthErrorResponse.fromJson(authJson);
      expect(auth.code, 400);
      expect(auth.toJson(), authJson);
    });
  });
}
