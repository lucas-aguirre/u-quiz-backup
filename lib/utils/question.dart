import 'package:u_quiz/utils/answer.dart';

class Question {
  final String question;
  final List<Answer> answers;
  final String correctAnswerDescription;

  Question(this.question, this.answers, this.correctAnswerDescription);
}