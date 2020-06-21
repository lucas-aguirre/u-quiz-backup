import 'package:flutter/material.dart';
import 'package:u_quiz/app_config.dart';
import 'package:u_quiz/pages/quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Material(
      color: Color.fromRGBO(203,218,78,1),
      child: new InkWell(
        onTap: () => Navigator.of(context).push(
          new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())
        ),
        child: new Padding(
          padding: new EdgeInsets.all(30),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/logo.png',
                width: 200,
              ),

              new Padding(
                padding: new EdgeInsets.only(bottom: 50),
              ),

              new Text(
                'Qual o seu conhecimento sobre a Ummense?',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

               new Padding(
                padding: new EdgeInsets.only(bottom: 20),
              ),

              new Text(
                'Toque na tela para iniciar',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      )
    );
  }
}