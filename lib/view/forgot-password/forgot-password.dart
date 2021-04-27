import 'package:bewp_life/const.dart';
import 'package:bewp_life/view/startup-screens/login-email.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const Route = '/forgot-password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          'Forgot Password',
          style: buildTextStyle(size: 18),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          height: getDeviceSize(context).height * 0.7,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/password.png',
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Forgot Password?',
                style: buildTextStyle(
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  'Please write your number to receive a confirmation code to set a new password.',
                  style: buildTextStyle(size: 16),
                  softWrap: true,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset('assets/images/india.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomRaisedButton(
                    child: Text(
                      'Confirm Number',
                      style: buildTextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
