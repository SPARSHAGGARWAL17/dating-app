import 'package:bewp_life/view/startup-screens/login-email.dart';
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
        primarySwatch: Colors.pink,
      ),
      home: LoginEmailPage(),
    );
  }
}

