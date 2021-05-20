import 'package:bewp_life/model/chat.dart';
import 'package:bewp_life/model/matches.dart';
import 'package:bewp_life/view/chats/matches-chat.dart';

import '../../export.dart';

class ChatPage extends StatefulWidget {
  final Matches match;
  ChatPage(this.match);
  static const Route = '/person-chat-page';
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  GlobalKey<AnimatedListState> listKey = GlobalKey();
  TextEditingController chatMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
               widget.match.image,
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
 widget.match.name , //TODO pass Dog NAme
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
                  key: listKey,
                  reverse: true,
                  itemCount: chats.length,
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return buildChatBubble(
                      index,
                      widget.match,
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
                      // height: 100,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: chatMessage,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Type message..',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ), //TODO add functionality
                    )),
                    InkWell(
                      onTap: chatMessage.text.isEmpty
                          ? null
                          : () {
                              print('pressed');
                              chats.insert(
                                0,
                                Chat(
                                  imageUrl: 'assets/images/dogs/dog1.jpeg',
                                  message: chatMessage.text,
                                  time: '15:00 PM',
                                  byMe: true,
                                  animationController: AnimationController(
                                    vsync: this,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                ),
                              );
                              setState(() {});
                              chatMessage.clear();
                              chats[0].animationController!.forward();
                            },
                      child: Container(
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
        ScaleTransition(
          scale: chats[index].animationController!,
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              chats[index].showTime = !chats[index].showTime;
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.all(0),
              child: Row(
                children: [
                  if (!chats[index].byMe)
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(match is Matches ? widget.match.image : ''),
                      radius: 18,
                    ),
                  // if (!chats[index].byMe &&
                  //     index + 1 != chats.length &&
                  //     chats[index + 1].byMe == chats[index].byMe)
                  //   SizedBox(
                  //     width: 36,
                  //   ),
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
                          decoration: BoxDecoration(
                              color: chats[index].byMe
                                  ? kPrimaryColor
                                  : kGreyColor,
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
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            // duration: Duration(milliseconds: 500),
                            child: Text(
                              chats[index].message,
                              style: buildTextStyle(
                                  color: chats[index].byMe
                                      ? Colors.white
                                      : Color(0xff062743)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        if (chats[index].showTime)
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
            ),
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
