import 'package:flutter/material.dart';

class QuestionDescription extends StatefulWidget {
  final String description;

  QuestionDescription(this.description);

  @override
  State createState() => new QuestionDescriptionState();
}

class QuestionDescriptionState extends State<QuestionDescription> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(QuestionDescription oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 3,
      child: new Material(
        color: Color.fromRGBO(43, 146, 217, 1),
        child: new Center(
          child: new Container(
            padding: new EdgeInsets.all(40),
            child: new Text(
              widget.description,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20)
            ),
          )
        ),
      )
    );
  }
}