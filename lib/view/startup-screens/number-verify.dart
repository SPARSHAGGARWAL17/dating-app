import 'package:bewp_life/view/startup-screens/otp-verify.dart';

import '../../export.dart';

class NumberVerifyPage extends StatefulWidget {
  static const Route = '/number-verify';
  @override
  _NumberVerifyPageState createState() => _NumberVerifyPageState();
}

class _NumberVerifyPageState extends State<NumberVerifyPage> {
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
              child: Text('Enter your number\n to verify',
                  textAlign: TextAlign.left,
                  style: buildTextStyle(weight: FontWeight.w900, size: 30)),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: formKey,
              child: TextFormField(
                onChanged: (v) {
                  setState(() {});
                },
                controller: numberController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Please provide a value';
                  return null;
                },
                maxLength: 10,
                decoration: InputDecoration(
                    labelText: 'Enter Phone Number',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kGreyColor),
                    ),
                    labelStyle: buildTextStyle(
                      color: kGreyColor,
                    ),
                    counterText: '',
                    icon: Container(
                      height: 30,
                      width: 60,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[300]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+91',
                            style: buildTextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.of(context).pushNamed(OtpVerifyPage.Route,
                      arguments: numberController.text);
                }
              },
              child: Container(
                width: double.maxFinite,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: numberController.text.length == 10
                      ? kPrimaryColor
                      : kGreyColor,
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
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Didn\'t receive a verification code? ',
            //         style: buildTextStyle(color: kGreyColor, size: 14),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           TextButton(
            //             onPressed: () {},
            //             style: ButtonStyle(
            //                 tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            //             child: Text(
            //               'Resend code | ',
            //               style: buildTextStyle(
            //                   color: kPrimaryColor,
            //                   size: 14,
            //                   weight: FontWeight.bold),
            //             ),
            //           ),
            //           TextButton(
            //             onPressed: () {},
            //             style: ButtonStyle(
            //                 tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            //             child: Text(
            //               'Change number',
            //               style: buildTextStyle(
            //                   color: kPrimaryColor,
            //                   size: 14,
            //                   weight: FontWeight.bold),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}
