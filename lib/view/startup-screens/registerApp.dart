import 'package:bewp_life/view/profile/update-profile.dart';
import 'package:bewp_life/view/startup-screens/number-verify.dart';
import 'package:intl/intl.dart';

import '../../export.dart';

class RegisterApp extends StatefulWidget {
  static const Route = '/register-app';
  @override
  _RegisterAppState createState() => _RegisterAppState();
}

class _RegisterAppState extends State<RegisterApp> {
  DateTime? dob;
  bool obscureText = true;
  bool confirmObscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String currentGender = 'Male';
  String? validator(String? value) {
    if (value!.isEmpty) return 'Please provide a value';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        toolbarHeight: 30,
        leading: IconButton(
          padding: EdgeInsets.all(10),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },

          //constraints: BoxConstraints(minHeight: 10),
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Transform.translate(
                          offset: Offset(0, 12),
                          child: Image.asset(
                            'assets/images/Vector.png',
                          )),
                      Transform.translate(
                          offset: Offset(20, -50),
                          child: Image.asset('assets/images/kitty.png')),
                    ],
                  ).expand,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/bubble2.png'),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text(
                          'Sign\nUp',
                          textAlign: TextAlign.center,
                          style: buildTextStyle(
                            size: 20,
                            weight: FontWeight.bold,
                            color: Color(0xff4718AD),
                          ),
                        ),
                      ),
                    ],
                  ).expand,
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              padding: const EdgeInsets.only(
                  top: 25.0, right: 25, left: 25, bottom: 0),
              height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Container(
                    height: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Text('Register to App',
                        //       textAlign: TextAlign.left,
                        //       style: buildTextStyle(
                        //           weight: FontWeight.w900, size: 24)),
                        // ),
                        TextFormField(
                          validator: validator,
                          controller: nameController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            suffix: getSuffixTick(
                                nameController.text.trim().split(' ').length >=
                                    2),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kGreyColor),
                            ),
                            labelStyle: buildTextStyle(
                              color: kGreyColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isValidEmail) return null;
                            return 'Invalid Email';
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            suffix: getSuffixTick(
                                emailController.text.isValidEmail),
                            labelText: 'Email',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kGreyColor),
                            ),
                            labelStyle: buildTextStyle(
                              color: kGreyColor,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            dob = await pickDate(dob);
                            setState(() {});
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              dob == null
                                  ? 'Date of Birth'
                                  : DateFormat('dd/MM/yyyy')
                                      .format(dob ?? DateTime.now()),
                              style: buildTextStyle(color: Colors.black),
                            ),
                            decoration: BoxDecoration(
                              border:
                                  Border(bottom: BorderSide(color: kGreyColor)),
                            ),
                          ),
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
                            buildButton(
                              check: currentGender == 'Male',
                              onPressed: () {
                                currentGender = 'Male';
                                setState(() {
                                  
                                });
                              },
                              title: 'Male',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                           buildButton(
                              check: currentGender == 'Female',
                              onPressed: () {
                                currentGender = 'Female';
                                setState(() {});
                              },
                              title: 'Female',
                            ),
                          ],
                        ),
                        TextFormField(
                          obscureText: obscureText,
                          controller: passwordController,
                          validator: validator,
                          decoration: InputDecoration(
                            suffix: getSuffixEye(
                              onPressed: () {
                                obscureText = !obscureText;
                                setState(() {});
                              },
                              boolValue: obscureText,
                            ),
                            labelText: 'Password',
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kGreyColor)),
                            labelStyle: buildTextStyle(
                              color: kGreyColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          obscureText: confirmObscureText,
                          validator: (value) {
                            if (passwordController.text != value) {
                              return 'Password didn\'t match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffix: getSuffixEye(
                                onPressed: () {
                                  confirmObscureText = !confirmObscureText;
                                  setState(() {});
                                },
                                boolValue: confirmObscureText,
                              ),
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
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Yes, I agree to the ',
                                style: buildTextStyle(
                                  color: Color(0xff200A4D).withOpacity(0.6),
                                  size: 15,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap),
                                child: Text(
                                  'Terms & Services.',
                                  style: buildTextStyle(
                                    color: Colors.black,
                                    size: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomRaisedButton(
                          child: Text(
                            'PROCEED',
                            style: buildTextStyle(
                              size: 20,
                              color: Colors.white,
                              weight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(UpdateProfileImagePage.Route);
                          },
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Existing User? ',
                                style: buildTextStyle(
                                    color: Color(0xff200A4D).withOpacity(0.6),
                                    size: 15),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap),
                                child: Text(
                                  'Log In',
                                  style: buildTextStyle(
                                    color: Color(0xff4718AD),
                                    size: 15,
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }

  Future<DateTime?> pickDate(DateTime? date) async {
    var _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(Duration(days: 365 * 15)),
      firstDate: DateTime.now().subtract(Duration(days: 365 * 80)),
      lastDate: DateTime.now().subtract(Duration(days: 365 * 12)),
    );
    if (_date != null) return _date;
    return date;
  }
}
