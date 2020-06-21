import 'package:u_quiz/main_common.dart';
import 'package:flutter/material.dart';
import 'package:u_quiz/app_config.dart';
import 'package:u_quiz/resources/display_color_app2.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "U-Quiz 2",
    appInternalId: 2,
    child: MyApp(),
  );

  mainCommon();

  runApp(configuredApp);
}