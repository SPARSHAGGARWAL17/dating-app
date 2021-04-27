import 'package:bewp_life/view/forgot-password/forgot-password.dart';
import 'package:bewp_life/view/forgot-password/verify-pin.dart';
import 'package:bewp_life/view/startup-screens/login-email.dart';
import 'package:bewp_life/view/startup-screens/onboard.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  WelcomePage.Route: (context)=> WelcomePage(),
  ForgotPasswordPage.Route: (context) => ForgotPasswordPage(),
  LoginEmailPage.Route: (context) => LoginEmailPage(),
  VerifyPinPage.Route: (context) => VerifyPinPage(),
};
