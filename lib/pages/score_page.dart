import 'package:flutter/material.dart';
import 'package:u_quiz/pages/landing_page.dart';
import 'package:u_quiz/main_common.dart' as mainCommon;

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Color.fromRGBO(43,146,217,1),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Sua pontuação foi: ',
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),

          new Text(
            score.toString() + "/" + totalQuestions.toString(),
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50
            ),
          ),

          new IconButton(
            tooltip: 'Recomeçar',
            icon: new Icon(Icons.refresh),
            color: Colors.white,
            iconSize: 50,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(
                builder: (BuildContext context) => new LandingPage()
              ),
              (Route route) => route == null
            ),
          )
        ],
      ),
    );
  }
}