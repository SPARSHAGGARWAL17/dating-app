import 'package:bewp_life/model/matches.dart';
import 'package:bewp_life/view/chats/chat-page.dart';
import 'package:flutter/rendering.dart';

import '../../export.dart';

class MatchesChatPage extends StatelessWidget {
  static const Route = '/all-matches-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFFB6C1),
                Color(0xffFFDDD1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: getDeviceSize(context).height * 0.18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Text(
                        'Matches',
                        style: buildTextStyle(size: 25),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: kMatches
                              .map(
                                (e) => Container(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: circleProfilePhoto(e.image, 30),
                                ),
                              )
                              .toList()),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                // margin:
                //     EdgeInsets.only(top: getDeviceSize(context).height * 0.18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 10, left: 20, top: 20),
                      child: Text(
                        "Chats",
                        style: buildTextStyle(size: 25),
                      ),
                    ),
                    Container(
                      height: getDeviceSize(context).height * 0.6,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: kMatches
                              .map((e) => buildScrollChatView(
                                  match: e, context: context))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ).expand
            ],
          ),
        ),
      ),
    );
  }

  Padding buildScrollChatView({
    required Matches match,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ChatPage.Route, arguments: match);
        },
        child: Row(
          children: [
            circleProfilePhoto(match.image, 30),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 5, left: 5, right: 10, top: 0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      match.name, //TODO Name change
                      style: buildTextStyle(
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'That\'s awesome man...', //TODO last Message Text
                      style: buildTextStyle(size: 12),
                    )
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: radius,
        ),
      ),
    );
  }
}
