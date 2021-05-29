// @dart=2.9

import '/export.dart';
import '/routes.dart';
import '/view/chats/chat-page.dart';
import '/view/chats/matches-chat.dart';
import '/view/profile/profile-form.dart';
import '/view/home-screens/match-dialog.dart';
import '/view/profile/update-profile.dart';
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
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        textSelectionTheme: Theme.of(context)
            .textSelectionTheme
            .copyWith(cursorColor: kPrimaryColor),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.pink,
        sliderTheme: SliderThemeData(
          activeTrackColor: kPrimaryColor,
          thumbColor: Colors.white,
          inactiveTrackColor: kGreyColor,
        ),
      ),
      onGenerateRoute: BewpLife.generateRoute,
      initialRoute: LoginEmailPage.Route,
    );
  }
}
