import 'dart:async';

import 'package:bewp_life/const.dart';
import 'package:bewp_life/view/startup-screens/login-email.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPinPage extends StatefulWidget {
  static const Route = '/verify-pin';
  @override
  _VerifyPinPageState createState() => _VerifyPinPageState();
}

class _VerifyPinPageState extends State<VerifyPinPage> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (timer.tick == 30) {
        timer.cancel();
      }
    });
  }

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
          'Verify PIN',
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
                  'Verify PIN',
                  style: buildTextStyle(
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Verification code sent to:',
                      style: buildTextStyle(),
                    ),
                    TextSpan(
                      text: '+91-999999999',
                      style: buildTextStyle(
                        color: Color(0xff4718AD),
                      ),
                    ),
                  ])
                      // style: buildTextStyle(size: 16),
                      // softWrap: true,
                      ),
                ),
                Container(
                  width: 250,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (value) {},
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: kPrimaryColor,
                      inactiveColor: kGreyColor,
                      selectedColor: kPrimaryColor,
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enableActiveFill: false,
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
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        '00:${timer.tick >= 30 ? '0${30 - timer.tick}' : 30 - timer.tick} Resend Confirmation Code',
                        style: buildTextStyle(weight: FontWeight.bold),
                      ),
                    )
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
