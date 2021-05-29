import '/model/matches.dart';
import '/view/chats/chat-page.dart';
import '/view/chats/matches-chat.dart';
import '/view/profile/profile-form.dart';
import '/view/home-screens/match-dialog.dart';
import '/view/profile/update-profile.dart';
import '/view/startup-screens/new-password.dart';
import '/view/startup-screens/number-verify.dart';
import '/view/startup-screens/otp-verify.dart';
import 'package:flutter/material.dart';
import 'export.dart';

// Map<String, Widget Function(BuildContext context)> routes = {
//   WelcomePage.Route: (context) => WelcomePage(),
//   ForgotPasswordPage.Route: (context) => ForgotPasswordPage(),
//   LoginEmailPage.Route: (context) => LoginEmailPage(),
//   VerifyPinPage.Route: (context) => VerifyPinPage(),
//   RegisterApp.Route: (context) => RegisterApp(),
//   OtpVerifyPage.Route: (context) => OtpVerifyPage(),
//   NumberVerifyPage.Route: (context) => NumberVerifyPage(),
//   NewPasswordPage.Route: (context) => NewPasswordPage(),
//   MatchesChatPage.Route: (context) => MatchesChatPage(),
//   HomePage.Route: (context) => HomePage(),
//   ChatPage.Route: (context) => ChatPage(),
//   MatchDialogPage.Route: (context) => MatchDialogPage(),
//   ProfileFormPage.Route: (context) => ProfileFormPage(),
//   UpdateProfileImagePage.Route: (context) => UpdateProfileImagePage(),
// };

class BewpLife {
  static String? routeName;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    routeName = settings.name;
    Widget currentWidget;
    switch (routeName) {
      case WelcomePage.Route:
        currentWidget = WelcomePage();
        break;
      case ForgotPasswordPage.Route:
        currentWidget = ForgotPasswordPage();
        break;
      case LoginEmailPage.Route:
        currentWidget = LoginEmailPage();
        break;
      case VerifyPinPage.Route:
        currentWidget = VerifyPinPage();
        break;
      case RegisterApp.Route:
        currentWidget = RegisterApp();
        break;
      case OtpVerifyPage.Route:
        currentWidget = OtpVerifyPage();
        break;
      case NumberVerifyPage.Route:
        currentWidget = NumberVerifyPage();
        break;
      case NewPasswordPage.Route:
        currentWidget = NumberVerifyPage();
        break;
      case NewPasswordPage.Route:
        currentWidget = NewPasswordPage();
        break;
      case MatchesChatPage.Route:
        currentWidget = MatchesChatPage();
        break;
      case HomePage.Route:
        currentWidget = HomePage();
        break;
      case ChatPage.Route:
        currentWidget = ChatPage(Matches.fromObject(settings.arguments));
        break;
      case MatchDialogPage.Route:
        currentWidget = MatchDialogPage();
        break;
      case ProfileFormPage.Route:
        currentWidget = ProfileFormPage();
        break;
      case UpdateProfileImagePage.Route:
        currentWidget = UpdateProfileImagePage();
        break;
      default:
        currentWidget = HomePage();
        break;
    }
    return MaterialPageRoute(
      builder: (context) => currentWidget,
    );
  }
}
