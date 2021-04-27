import 'package:bewp_life/const.dart';
import 'package:bewp_life/view/startup-screens/login-email.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static const Route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: getDeviceSize(context).height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/carousel.png'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomRaisedButton(
                  child: Text(
                    'Get Started',
                    style: buildTextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      createRoute(LoginEmailPage()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
