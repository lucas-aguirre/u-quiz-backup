import 'package:flutter/material.dart';
import 'package:u_quiz/UI/answer_button.dart';
import 'package:u_quiz/UI/correct_wrong_overlay.dart';
import 'package:u_quiz/UI/question_description.dart';
import 'package:u_quiz/pages/score_page.dart';
import 'package:u_quiz/utils/answer.dart';
import 'package:u_quiz/utils/question.dart';
import 'package:u_quiz/utils/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  bool isCorrect;
  bool overlayShouldBeVisible = false;
  String name;

  Question currentQuestion;

  Quiz quiz = new Quiz([
    new Question(
      'Qual foi a data de lançamento da Tratativa?',
      [
        new Answer('05/07/2017', false),
        new Answer('02/09/2017', true),
        new Answer('03/09/2017', false),
        new Answer('02/08/2017', false),
      ],
      'A data de lançamento da Tratativa foi em 02/09/2017!'
    ),

    new Question(
      'Qual foi a data de lançamento da Ummense?',
      [
        new Answer('07/05/2019', true),
        new Answer('01/06/2019', false),
        new Answer('15/03/2019', false),
        new Answer('20/04/2019', false),
      ],
      'A data de lançamento da Ummense foi em 07/05/2019!'
    ),

    new Question(
      'Qual a bebida que a maioria dos Devs costumam tomar diariamente no trabalho?',
      [
        new Answer('Vodka', false),
        new Answer('Chá', false),
        new Answer('Café', true),
        new Answer('Refrigerante', false),
      ],
      'Café hoje, café amanhã, café sempre!'
    ),

    new Question(
      'Quantas organizações ativas a Ummense tem cadastradas atualmente? (Até a data de 27/08/2019)',
      [
        new Answer('Entre 100 e 500', false),
        new Answer('Entre 500 e 1000', true),
        new Answer('Entre 1000 e 2000', false),
        new Answer('Mais de 8000', false),
      ],
      'Até o dia 27/08/2019 a Ummense possui entre 500 e 1000 organizações cadastradas!'
    ),

    new Question(
      'Quantos cards foram criados na Ummense até hoje? (Até a data de 27/08/2019)',
      [
        new Answer('Entre 1000 e 4000', false),
        new Answer('Entre 4000 e 7000', true),
        new Answer('Entre 7000 e 10000', false),
        new Answer('Entre 10000 e 13000', false),
      ],
      'Até o dia 27/08/2019 a Ummense possui entre 4000 e 7000 cards ativos!'
    ),

    new Question(
      'Quantas tarefas foram criadas na Ummense até hoje? (Até a data de 27/08/2019)',
      [
        new Answer('Entre 2000 e 4000', false),
        new Answer('Entre 4000 e 6000', false),
        new Answer('Entre 6000 e 8000', false),
        new Answer('Entre 8000 e 10000', true),
      ],
      'Até o dia 27/08/2019 a Ummense possui entre 8000 e 10000 tarefas criadas!'
    ),

    new Question(
      'Qual o nome dos personagens azuis da Ummense?',
      [
        new Answer('Ummanos', true),
        new Answer('Umanos Browns', false),
        new Answer('Hummanos', false),
        new Answer('Yummanos', false),
      ],
      'A resposta correta é Ummanos!'
    ),

    new Question(
      'Qual a melhor ferramenta para aumentar a produtividade das empresas?',
      [
        new Answer('Asana', false),
        new Answer('Ummense', true),
        new Answer('Jequiti', false),
        new Answer('Netflix', false),
      ],
      'Óbviamente que a melhor ferramenta para aumentar a produtividade é a Ummense!'
    ),
  ]);

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
  }

  void handleAnswer(int answer) {
    isCorrect = (currentQuestion.answers[answer].isCorrect);

    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new QuestionDescription(currentQuestion.question),
            new AnswerButton(currentQuestion.answers[0].description, () => handleAnswer(0)),
            new AnswerButton(currentQuestion.answers[1].description, () => handleAnswer(1)),
            new AnswerButton(currentQuestion.answers[2].description, () => handleAnswer(2)),
            new AnswerButton(currentQuestion.answers[3].description, () => handleAnswer(3)),
          ]
        ),
        overlayShouldBeVisible == true
        ? new CorrectWrongOverlay(
          isCorrect,
          currentQuestion.correctAnswerDescription,
          () {
            if ( quiz.length == quiz.questionNumber + 1 ) {
              Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(
                  builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)
                ),
                (Route route) => route == null
              );
              return;
            }

            currentQuestion = quiz.nextQuestion;

            this.setState(() {
              overlayShouldBeVisible = false;
            });
        })
        : new Container()
      ],
    );
  }
}
