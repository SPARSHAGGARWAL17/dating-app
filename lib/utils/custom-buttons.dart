import 'package:bewp_life/export.dart';

ElevatedButton buildButton(
    {required String title,
    bool check = false,
    required Function() onPressed}) {
  return ElevatedButton(
    style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: kPrimaryColor, width: 3),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(check ? kPrimaryColor : Colors.white),
        minimumSize: MaterialStateProperty.all(Size(110, 35))),
    onPressed: onPressed,
    child: Center(
      child: Text(
        title,
        style: buildTextStyle(
          size: 17,
          color: check ? Colors.white : kPrimaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
