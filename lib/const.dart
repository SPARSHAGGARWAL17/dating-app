import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffFFB6C1);
const Color kGreyColor = Color(0xffD9DDE2);
const Color kBabyPinkColor = Color(0xffFFB6C1);
const Color kDarkPinkColor = Color(0xffFC7D90);
const Color kPurpleColor = Color(0xff4718AD);

Size getDeviceSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

TextStyle buildTextStyle({
  String family = 'SFProDisplay',
  double size = 15,
  FontWeight weight = FontWeight.normal,
  Color color = Colors.black,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontFamily: family,
    fontSize: size,
    fontWeight: weight,
    color: color,
    decoration: decoration,
  );
}

PageRoute createRoute(Widget pageWidget) {
  return MaterialPageRoute(
    builder: (context) {
      return pageWidget;
    },
  );
}
