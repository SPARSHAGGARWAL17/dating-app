// @dart=2.9

import 'package:bewp_life/export.dart';
import 'package:bewp_life/routes.dart';
import 'package:bewp_life/view/home-screens/chat-page.dart';
import 'package:bewp_life/view/home-screens/match-dialog.dart';
import 'package:bewp_life/view/home-screens/matches-chat.dart';
import 'package:bewp_life/view/startup-screens/number-verify.dart';
import 'package:bewp_life/view/startup-screens/welcome-page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bewp Life',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.pink,
      ),
      // routes: routes,
      // initialRoute: WelcomePage.Route,
     home: RegisterApp(),
    );
  }
}
