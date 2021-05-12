import '../../export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyPage extends StatefulWidget {
  static const Route = '/verify-otp';
  @override
  _OtpVerifyPageState createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  @override
  Widget build(BuildContext context) {
    var number = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Enter 4 digit code sent',
                  textAlign: TextAlign.left,
                  style: buildTextStyle(weight: FontWeight.w900, size: 25)),
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('to you at ',
                      textAlign: TextAlign.left,
                      style: buildTextStyle(weight: FontWeight.w900, size: 25)),
                ),
                Text(
                  '+91-$number',
                  textAlign: TextAlign.left,
                  style: buildTextStyle(
                    weight: FontWeight.w900,
                    size: 25,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                borderWidth: 1,
                inactiveColor: kGreyColor,
                activeFillColor: kGreyColor,
                selectedColor: kPrimaryColor,
                activeColor: Colors.black,
              ),
              showCursor: false,
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: false,
              onChanged: (value) {},
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Null;
              },
              child: Container(
                width: double.maxFinite,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: kPrimaryColor,
                ),
                child: Center(
                  child: Text(
                    'Verify',
                    style: buildTextStyle(
                        size: 17, color: Colors.white, weight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t recieve a verification code? ',
                    style: buildTextStyle(color: kGreyColor, size: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(
                          'Resend code | ',
                          style: buildTextStyle(
                              color: kPrimaryColor,
                              size: 14,
                              weight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(
                          'Change number',
                          style: buildTextStyle(
                              color: kPrimaryColor,
                              size: 14,
                              weight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
