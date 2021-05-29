import '/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginEmailPage extends StatefulWidget {
  static const Route = '/login';
  @override
  _LoginEmailPageState createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends State<LoginEmailPage> {
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.4,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 50,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/images/bubble.png'),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  'Hi',
                                  style: buildTextStyle(
                                    size: 25,
                                    weight: FontWeight.bold,
                                    color: Color(0xff4718AD),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Welcome',
                            style: buildTextStyle(
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 100,
                    // ),
                    Positioned(
                      // right: 0,
                      // bottom: 0,
                      child: Transform.translate(
                        offset: Offset(170, 20),
                        child: Image.asset(
                          'assets/images/girl.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.7,
                width: double.infinity,
                padding: EdgeInsets.all((25)),
                margin: EdgeInsets.only(top: size.height * 0.3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  height: size.height * 0.62,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            'Log In',
                            style: buildTextStyle(
                              weight: FontWeight.bold,
                              size: 34,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        TextFormField(
                          controller: emailController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: buildTextStyle(size: 18),
                            suffix: getSuffixTick(
                                emailController.text.isValidEmail),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kGreyColor),
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: buildTextStyle(size: 18),
                            suffix: getSuffixEye(
                              onPressed: () {
                                obscureText = !obscureText;
                                setState(() {});
                              },
                              boolValue: obscureText,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kGreyColor),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(ForgotPasswordPage.Route);
                              },
                              child: Text(
                                'Need Help?',
                                style: buildTextStyle(color: kGreyColor),
                              ),
                            ),
                          ],
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
                            Navigator.of(context).pushNamed(HomePage.Route);
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Text(
                            'Or Log In With',
                            style: buildTextStyle(
                              color: Color(0xff200A4D).withOpacity(0.6),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildThirdPartyLogin('google', () {}),
                            SizedBox(
                              width: 25,
                            ),
                            buildThirdPartyLogin('facebook', () {}),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(RegisterApp.Route);
                          },
                          child: Text(
                            'Create Account',
                            style: buildTextStyle(
                              size: 20,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 1,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildThirdPartyLogin(String imageName, Function() onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: CircleAvatar(
          maxRadius: 20,
          backgroundColor: Colors.white,
          child: SvgPicture.asset('assets/svg/$imageName.svg'),
        ),
      ),
    );
  }
}

class CustomRaisedButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final bool invert;
  const CustomRaisedButton({
    required this.child,
    required this.onPressed,
    this.invert = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        shadowColor: MaterialStateProperty.all(Colors.white),
        backgroundColor:
            MaterialStateProperty.all(invert ? Colors.white : kBabyPinkColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
                color: invert ? kPrimaryColor : Colors.white, width: 3),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(120, 55)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
