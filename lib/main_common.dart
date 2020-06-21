import 'package:flutter/material.dart';
import 'package:u_quiz/app_config.dart';
import 'package:u_quiz/pages/landing_page.dart';

void main() {
  runApp(new MaterialApp(
    home: new LandingPage(),
  ));
}

void mainCommon() {
  // Here would be background init code, if any
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return _buildApp(config.appDisplayName);
  }

  Widget _buildApp(String appName){
    return MaterialApp(
      title: appName,
      home: LandingPage(),
    );
  }
}