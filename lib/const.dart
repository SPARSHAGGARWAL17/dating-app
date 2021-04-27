import 'package:flutter/material.dart';

// const Color kPrimaryColor = Color(0xffFFB6C1);
const Color kGreyColor = Color(0xffD9DDE2);
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
