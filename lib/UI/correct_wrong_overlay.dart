import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {

  final bool isCorrect;
  final VoidCallback onTap;
  final String answerDescription;

  CorrectWrongOverlay(this.isCorrect, this.answerDescription, this.onTap);

  @override
  State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation<double> iconAnimation;
  AnimationController iconAnimationController;
  String answerDescription;

  @override
  void initState() {
    super.initState();
    iconAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
    iconAnimation = new CurvedAnimation(parent: iconAnimationController, curve: Curves.elasticOut);
    iconAnimation.addListener(() => this.setState(() {}));
    iconAnimationController.forward();
    answerDescription = widget.answerDescription;
  }

  @override
  void dispose() {
    iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget.onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(
                angle: iconAnimation.value * 2 * pi,
                child: new Icon(
                  widget.isCorrect ? Icons.done : Icons.clear,
                  size: iconAnimation.value * 80,
                  color: widget.isCorrect ? Colors.green : Colors.red
                ),
              )
            ),

            new Padding(
              padding: new EdgeInsets.all(20.0),
            ),

            new Text(
              widget.isCorrect ? 'Acertou! $answerDescription' : 'Errou! $answerDescription',
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        )
      )
    );
  }
}