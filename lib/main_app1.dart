import 'package:u_quiz/main_common.dart';
import 'package:flutter/material.dart';
import 'package:u_quiz/app_config.dart';
import 'package:u_quiz/resources/display_color_app1.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "U-Quiz 1",
    appInternalId: 1,
    child: MyApp(),
  );

  mainCommon();

  runApp(configuredApp);
}