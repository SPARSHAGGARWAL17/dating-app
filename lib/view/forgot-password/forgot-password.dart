import '/const.dart';
import '/view/forgot-password/verify-pin.dart';
import '/view/startup-screens/login-email.dart';
import '/view/startup-screens/otp-verify.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const Route = '/forgot-password';
  final TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
        child: SingleChildScrollView(
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
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: numberController,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) return 'Please provide number';
                      if (value.length != 10)
                        return 'Please enter a valid number';
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      icon: Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('+91'),
                      ),
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
                      onPressed: () {
                        bool validated = formKey.currentState!.validate();
                        if (validated) {
                          Navigator.of(context).pushNamed(VerifyPinPage.Route,
                              arguments: numberController.text);
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
