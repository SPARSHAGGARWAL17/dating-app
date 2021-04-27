import 'package:bewp_life/routes.dart';
import 'package:bewp_life/view/forgot-password/forgot-password.dart';
import 'package:bewp_life/view/forgot-password/verify-pin.dart';
import 'package:bewp_life/view/startup-screens/onboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bewp Life',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.pink,
      ),
      routes: routes,
      home: WelcomePage(),
    );
  }
}
