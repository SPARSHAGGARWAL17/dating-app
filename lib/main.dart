// @dart=2.9

import 'package:bewp_life/export.dart';
import 'package:bewp_life/routes.dart';
import 'package:bewp_life/view/chats/chat-page.dart';
import 'package:bewp_life/view/chats/matches-chat.dart';
import 'package:bewp_life/view/profile/profile-form.dart';
import 'package:bewp_life/view/home-screens/match-dialog.dart';
import 'package:bewp_life/view/profile/update-profile.dart';
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
