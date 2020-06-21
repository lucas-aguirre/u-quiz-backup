import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback _onTap;
  final String answerDescription;

  AnswerButton(this.answerDescription, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: Color.fromRGBO(43,146,217,1),
        child: new InkWell(
          splashColor: Colors.white,
          onTap: () => _onTap(),
          child: new Center (
            child: new Container(
              padding: new EdgeInsets.all(30.0),
              child: new Text(
                "$answerDescription",
                style: new TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
              )
            )
          )
        ),
      )
    );
  }
}