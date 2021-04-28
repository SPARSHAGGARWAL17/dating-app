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
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: 800,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Register to App',
                          textAlign: TextAlign.left,
                          style: buildTextStyle(
                              weight: FontWeight.w900, size: 24)),
                    ),
                    TextFormField(
                      validator: validator,
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kGreyColor),
                        ),
                        labelStyle: buildTextStyle(
                          color: kGreyColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: validator,
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
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
                          style: buildTextStyle(color: kGreyColor),
                        ),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: kGreyColor)),
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
                        buildGenderButton('Male'),
                        SizedBox(
                          width: 10,
                        ),
                        buildGenderButton('Female'),
                      ],
                    ),
                    TextFormField(
                      validator: validator,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kGreyColor)),
                        labelStyle: buildTextStyle(
                          color: kGreyColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      validator: validator,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kGreyColor)),
                        labelStyle: buildTextStyle(
                          color: kGreyColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (passwordController.text != value) {
                          return 'Password didn\'t match';
                        }
                        return null;
                      },
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // TODO register app here
                          // TODO add more validation
                          print('Register app');
                          Navigator.of(context)
                              .pushNamed(NumberVerifyPage.Route);
                        }
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                                'at the Vermo ',
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
