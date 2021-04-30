import 'package:bewp_life/view/home-screens/chat-page.dart';
import 'package:flutter/rendering.dart';

import '../../export.dart';

class MatchesChatPage extends StatefulWidget {
  @override
  _MatchesChatPageState createState() => _MatchesChatPageState();
}

class _MatchesChatPageState extends State<MatchesChatPage> {
  late String dogName;
  late String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'Matches',
            style: buildTextStyle(size: 22),
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < 6; i++)
                circleProfilePhoto('${ImageUrl[i]}', 36),
              //TODO Display Recent Match Profile image Accordingly
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 20, top: 20),
          child: Text(
            "Chats",
            style: buildTextStyle(size: 22),
          ),
        ),
        Container(
          height: getDeviceSize(context).height * 0.625,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                for (int i = 0; i < 6; i++)
                  buildScrollChatView(
                      Name[i],
                      ImageUrl[
                          i]), //TODO Display Recent Match Chats Accordingly
              ],
            ),
          ),
        )
      ],
    )));
  }

  List<String> Name = [
    'Denise Burton',
    'Maria Long',
    'Deborah Plamer',
    'Crystal Castilo',
    'Julia Morris',
    'Christina Evans'
  ];
  List<String> ImageUrl = [
    'assets/images/dogs/dog1.jpeg',
    'assets/images/dogs/dog2.jpeg',
    'assets/images/dogs/dog3.jpeg',
    'assets/images/dogs/dog4.jpeg',
    'assets/images/dogs/dog5.jpeg',
    'assets/images/dogs/dog6.jpeg'
  ];

  Padding buildScrollChatView(String name, String image) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatPage(image, name),
          ));
        },
        child: Row(
          children: [
            circleProfilePhoto(image, 30),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 5, left: 5, right: 10, top: 0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name, //TODO Name change
                      style: buildTextStyle(size: 14, weight: FontWeight.bold),
                    ),
                    Text('That\'s awesome man...', //TODO last Message Text
                        style: buildTextStyle(size: 12))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding circleProfilePhoto(String image, double radius) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: radius,
      ),
    );
  }
}
