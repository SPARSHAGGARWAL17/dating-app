import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffFFB6C1);
const Color kGreyColor = Color(0xffD9DDE2);
const Color kBabyPinkColor = Color(0xffFFB6C1);

Size getDeviceSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

TextStyle buildTextStyle({
  String family = 'SFProDisplay',
  double size = 15,
  FontWeight weight = FontWeight.normal,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontFamily: family,
    fontSize: size,
    fontWeight: weight,
    color: color,
  );
}

PageRoute createRoute(Widget pageWidget) {
  return MaterialPageRoute(
    builder: (context) {
      return pageWidget;
    },
  );
}
