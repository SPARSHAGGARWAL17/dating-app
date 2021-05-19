import 'package:bewp_life/export.dart';

extension Expansion on Widget {
  Expanded get expand => Expanded(
        child: this,
        flex: 1,
      );
  Expanded expandFlex(int flex) => Expanded(
        child: this,
        flex: flex,
      );
}

extension Validity on String{
  bool get isValidEmail {
      RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(this);
  }
}
