import 'package:u_quiz/utils/question.dart';

class Quiz {
  List<Question> _questions;
  String _name;
  int _questionNumber = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  List<Question> get questions => _questions;
  String get name => _name;
  int get score => _score;
  int get length => _questions.length;
  int get questionNumber => _questionNumber;

  Question get nextQuestion {
    _questionNumber++;

    if ( questionNumber >= length ) {
      return null;
    }

    return _questions[_questionNumber];
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }

  void updateName(String name) {
    _name = name;
  }
}