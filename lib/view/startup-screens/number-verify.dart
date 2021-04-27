import '../../export.dart';

class NumberVerifyPage extends StatefulWidget {
  @override
  _NumberVerifyPageState createState() => _NumberVerifyPageState();
}

class _NumberVerifyPageState extends State<NumberVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
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
            TextFormField(
              keyboardType: TextInputType.number,
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
                    width: 50,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[600]),
                    child: Center(
                      child: Text(
                        '+91',
                        style: buildTextStyle(color: Colors.white),
                      ),
                    ),
                  )),
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
                  color: kGreyColor,
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
                        onPressed: () {
                          Null;
                        },
                        style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(
                          'Resend code | ',
                          style: buildTextStyle(color: kPrimaryColor, size: 14,weight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Null;
                        },
                        style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(
                          'Change number',
                          style: buildTextStyle(color: kPrimaryColor, size: 14,weight: FontWeight.bold),
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
