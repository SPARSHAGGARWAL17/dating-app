import 'package:bewp_life/export.dart';

class Chat {
  String message;
  String time;
  String imageUrl;
  bool byMe;
  bool showTime;
  AnimationController? animationController;

  Chat({
    required this.imageUrl,
    required this.message,
    required this.time,
    required this.byMe,
    this.showTime = false,
    this.animationController,
  });
}

List<Chat> chats = [
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: true,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: true,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'I have also interested on that nice greene',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: true,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message:
  //       'I have also interested on that nice greene county. One of my cousin visited there. And I am really excited.',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: true,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message:
  //       'I have also interested on that nice greene county. One of my cousin visited there. And I am really excited.',
  //   time: '14.09',
  //   byMe: true,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: true,
  // ),
  // Chat(
  //   imageUrl: 'assets/images/dogs/dog1.jpeg',
  //   message: 'Hi',
  //   time: '14.09',
  //   byMe: false,
  // ),
];
