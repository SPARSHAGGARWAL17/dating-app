// @dart=2.9

import 'package:bewp_life/export.dart';
import 'package:bewp_life/routes.dart';
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
      routes: routes,
      initialRoute: WelcomePage.Route,
    );
  }
}
