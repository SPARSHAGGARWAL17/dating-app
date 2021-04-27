import '../../export.dart';

class RegisterApp extends StatefulWidget {
  @override
  _RegisterAppState createState() => _RegisterAppState();
}

class _RegisterAppState extends State<RegisterApp> {
  @override
  String currentGender = 'Male';
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
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Container(
              height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Register to App',
                        textAlign: TextAlign.left,
                        style:
                            buildTextStyle(weight: FontWeight.w900, size: 24)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Name',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kGreyColor)),
                        labelStyle: buildTextStyle(
                          color: kGreyColor,
                        )),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kGreyColor)),
                        labelStyle: buildTextStyle(
                          color: kGreyColor,
                        )),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kGreyColor)),
                        labelStyle: buildTextStyle(
                          color: kGreyColor,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Gender',
                      style: TextStyle(color: kGreyColor, fontSize: 18),
                    ),
                  ),
                  Row(
                    children: [
                      buildGenderButton('Male'),
                      SizedBox(
                        width: 10,
                      ),
                      buildGenderButton('Female'),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kGreyColor)),
                        labelStyle: buildTextStyle(
                          color: kGreyColor,
                        )),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kGreyColor)),
                        labelStyle: buildTextStyle(
                          color: kGreyColor,
                        )),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kGreyColor)),
                        labelStyle: buildTextStyle(
                          color: kGreyColor,
                        )),
                  ),
                  SizedBox(
                    height: 40,
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
                          'Register',
                          style: buildTextStyle(
                              size: 17,
                              color: Colors.white,
                              weight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'By registering you agree to ',
                              style:
                                  buildTextStyle(color: kGreyColor, size: 12),
                            ),
                            TextButton(
                              onPressed: () {
                                Null;
                              },
                              style: ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap),
                              child: Text(
                                'Terms and Conditions',
                                style: buildTextStyle(
                                    color: kPrimaryColor, size: 12),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'and ',
                              style:
                                  buildTextStyle(color: kGreyColor, size: 12),
                            ),
                            TextButton(
                              onPressed: () {
                                Null;
                              },
                              style: ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap),
                              child: Text(
                                'Privacy Policy ',
                                style: buildTextStyle(
                                    color: kPrimaryColor, size: 12),
                              ),
                            ),
                            Text(
                              'at the Verma ',
                              style:
                                  buildTextStyle(color: kGreyColor, size: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton buildGenderButton(String title) {
    return TextButton(
      onPressed: () {
        currentGender = title;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: currentGender == title ? kPrimaryColor : kGreyColor,
        ),
        height: 35,
        width: 120,
        child: Center(
          child: Text(
            title,
            style: buildTextStyle(size: 17),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
