
import 'package:bewp_life/view/chats/chat-page.dart';
import 'package:bewp_life/view/chats/matches-chat.dart';
import 'package:bewp_life/view/home-screens/match-dialog.dart';
import 'package:bewp_life/view/startup-screens/new-password.dart';
import 'package:bewp_life/view/startup-screens/number-verify.dart';
import 'package:bewp_life/view/startup-screens/otp-verify.dart';
import 'package:flutter/material.dart';
import 'export.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  WelcomePage.Route: (context) => WelcomePage(),
  ForgotPasswordPage.Route: (context) => ForgotPasswordPage(),
  LoginEmailPage.Route: (context) => LoginEmailPage(),
  VerifyPinPage.Route: (context) => VerifyPinPage(),
  RegisterApp.Route: (context) => RegisterApp(),
  OtpVerifyPage.Route: (context) => OtpVerifyPage(),
  NumberVerifyPage.Route: (context) => NumberVerifyPage(),
  NewPasswordPage.Route: (context) => NewPasswordPage(),
  MatchesChatPage.Route: (context) => MatchesChatPage(),
  HomePage.Route: (context) => HomePage(),
  ChatPage.Route: (context) => ChatPage(),
  MatchDialogPage.Route: (context) => MatchDialogPage(),
};
