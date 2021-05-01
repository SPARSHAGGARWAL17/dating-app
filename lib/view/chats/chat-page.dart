import 'package:bewp_life/model/chat.dart';
import 'package:bewp_life/model/matches.dart';
import 'package:bewp_life/view/chats/matches-chat.dart';

import '../../export.dart';

class ChatPage extends StatefulWidget {
  static const Route = '/person-chat-page';
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var match = ModalRoute.of(context)!.settings.arguments;
    // TODO replace this with current chat state
    // String image = widget.image;
    // String name = widget.name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: getDeviceSize(context).height * 0.1,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 26,
              ),
            ),
            buildCircleProfilePicture(
              25,
              match is Matches ? match.image : '',
            ), //TODO add profile image accordingly
            SizedBox(
              width: 20,
            ),
            Container(
              // height: getDeviceSize(context).height * 0.055,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    match is Matches ? match.name : '', //TODO pass Dog NAme
                    style: buildTextStyle(size: 18, color: Color(0xFF474747)),
                  ),
                  Text(
                    'Owner Name: Woof Woof', //TODO Pass owner name
                    style: buildTextStyle(size: 14, color: Color(0xFF787878)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: getDeviceSize(context).height * 0.1,
                //color: Colors.red,
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {}, //TODO Add Button
                  child: CircleAvatar(
                    radius: 19,
                    backgroundColor: Color(0xFFFE3C72).withOpacity(0.150999),
                    child: Icon(
                      Icons.more_vert,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                //color: Colors.red,
                // height: getDeviceSize(context).height * 0.7,
                child: ListView.separated(
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 0,
                    );
                  },
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return buildChatBubble(
                      index,
                      match is Matches
                          ? match
                          : Matches(image: '', name: 'Error match'),
                      context,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                height: getDeviceSize(context).height * 0.0668,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 25,
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                          ),
                        ),
                      ), //TODO add functionality
                    )),
                    Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(40),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(40)),
                        color: Color(0xFFFFB6C1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.send,
                          color: Colors.pink,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Row buildChatBubble(int index, Object match, BuildContext context) {
    return Row(
      mainAxisAlignment:
          chats[index].byMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: Row(
            children: [
              if (!chats[index].byMe &&
                      index + 1 != chats.length &&
                      chats[index + 1].byMe != chats[index].byMe ||
                  index == chats.length - 1)
                CircleAvatar(
                  backgroundImage:
                      AssetImage(match is Matches ? match.image : ''),
                  radius: 18,
                ),
              if (!chats[index].byMe &&
                  index + 1 != chats.length &&
                  chats[index + 1].byMe == chats[index].byMe)
                SizedBox(
                  width: 36,
                ),
              // if (index == chats.length - 1)
              //   SizedBox(
              //     width: 36,
              //   ),
              SizedBox(
                width: 15,
              ),
              LimitedBox(
                maxWidth: getDeviceSize(context).width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // width: getDeviceSize(context).width * 0.7,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: chats[index].byMe ? kPrimaryColor : kGreyColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: chats[index].byMe
                                ? Radius.circular(10)
                                : Radius.circular(0),
                            bottomRight: !chats[index].byMe
                                ? Radius.circular(10)
                                : Radius.circular(0),
                          )),
                      child: Text(
                        chats[index].message,
                        style: buildTextStyle(
                            color: chats[index].byMe
                                ? Colors.white
                                : Color(0xff062743)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      chats[index].time,
                      style: buildTextStyle(
                        size: 12,
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  CircleAvatar buildCircleProfilePicture(double radius, String profileImage) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      radius: radius,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: Image(
          image: AssetImage(profileImage),
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}