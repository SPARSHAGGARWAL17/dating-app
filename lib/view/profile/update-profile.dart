import 'dart:io';

import 'package:bewp_life/const.dart';
import 'package:bewp_life/view/home-screens/home-page.dart';
import 'package:bewp_life/view/startup-screens/login-email.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileImagePage extends StatefulWidget {
  static const Route = '/update-profile-image';
  @override
  _UpdateProfileImagePageState createState() => _UpdateProfileImagePageState();
}

class _UpdateProfileImagePageState extends State<UpdateProfileImagePage> {
  File? image;
  void pickImage() async {
    var _image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (_image != null) {
      image = File(_image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBabyPinkColor,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(180, 0),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff8F0A1E).withOpacity(0.2),
                    radius: 180,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  height: getDeviceSize(context).height * 0.75,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                          height: getDeviceSize(context).height * 0.5,
                          decoration: BoxDecoration(
                            color: Color(0xffededed),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: Icon(
                                  Icons.add,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomRaisedButton(
                        child: Text(
                          'PROCEED',
                          style: buildTextStyle(
                            color: Colors.white,
                            size: 20,
                            weight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(HomePage.Route, (route) => false);
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload\nImage',
                          style: buildTextStyle(
                            size: 25,
                            color: kPurpleColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(80, -28),
                          child: Image.asset('assets/images/dog-hand.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
