import '/export.dart';

Widget getSuffixTick(bool value) {
  return value
      ? CircleAvatar(
          backgroundColor: Colors.green,
          radius: 10,
          child: Icon(
            Icons.done,
            color: Colors.white,
            size: 10,
          ),
        )
      : Container(
          height: 0,
          width: 0,
        );
}

Widget getSuffixEye({required Function() onPressed,required bool boolValue}) {
  return IconButton(
    onPressed: onPressed,
    icon: Icon(
      Icons.remove_red_eye,
      color: boolValue ? Colors.grey : kPrimaryColor,
      size: 20,
    ),
  );
}
