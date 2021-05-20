import 'dart:math' as math;
import 'package:animations/animations.dart';
import 'package:bewp_life/model/cards.dart';
import 'package:bewp_life/utils/custom-bottom-bar.dart';
import 'package:bewp_life/view/chats/matches-chat.dart';
import 'package:bewp_life/view/home-screens/match-dialog.dart';
import 'package:bewp_life/view/profile/profile-form.dart';
import 'package:bewp_life/view/home-screens/single-page-card.dart';
import 'package:bewp_life/view/profile/profile-page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../cards/card-animation.dart';
import '../../export.dart';

class HomePage extends StatefulWidget {
  static const Route = '/home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  double dx = 0;
  double prevDx = 0;
  double age = 0;
  double distance = 0;
  bool left = false;
  bool value = false;
  PageController pageController = PageController(initialPage: 0);
  PanelController panelController = PanelController();
  // late AnimationController animationController;
  CardController cardController = CardController();
  late Tween<double> tween;
  bool animating = false;

  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 1000));
    // tween = Tween<double>(begin: 0, end: 1)
    //   ..animate(
    //     CurvedAnimation(
    //       parent: animationController,
    //       curve: Curves.easeInOutExpo,
    //     ),
    //   ).addListener(() {
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    // animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 0,
      controller: panelController,
      backdropTapClosesPanel: true,
      backdropEnabled: true,
      maxHeight: getDeviceSize(context).height * 0.8,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      panel: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        panelController.close();
                      },
                    ),
                    // Spacer(
                    //     // flex: 5,
                    //     ),
                    Text(
                      'FILTER',
                      style: shadowTextStyle(
                        weight: FontWeight.w500,
                        size: 20,
                      ),
                    ),
                    // Spacer(
                    //     // flex: 4,
                    //     ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          age = 0;
                          distance = 0;
                        });
                      },
                      child: Text(
                        'Reset',
                        style: buildTextStyle(color: Colors.black38),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Looking For', style: shadowTextStyle()),
                    Row(
                      children: [
                        buildButton(
                          title: 'Male',
                          check: false,
                          onPressed: () {},
                        ),
                        SizedBox(width: 20),
                        buildButton(
                          title: 'Female',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Text('Age', style: shadowTextStyle()),
                    Slider(
                      value: age,
                      label: 'Age',
                      onChanged: (value) {
                        setState(() {
                          age = value;
                        });
                      },
                    ),
                    Text('Distance', style: shadowTextStyle()),
                    Slider(
                      value: distance,
                      label: 'Distance',
                      onChanged: (value) {
                        setState(() {
                          distance = value;
                        });
                      },
                    ),
                    Text('Hair Colour', style: shadowTextStyle()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildButton(title: 'Black', onPressed: () {}),
                        buildButton(title: 'Blue', onPressed: () {}),
                        buildButton(title: 'White', onPressed: () {}),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton(title: 'Brown', onPressed: () {}),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomRaisedButton(
                      child: Text(
                        'APPLY',
                        style: buildTextStyle(
                          size: 20,
                          color: kPrimaryColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        panelController.close();
                      },
                      invert: true,
                    )
                  ],
                ),
              ).expand,
            ],
          ),
          // height: ,
          // decoration: BoxDecoration(
          //   borderRadius:
          // ),
        ),
      ),
      body: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   automaticallyImplyLeading: false,
          //   backgroundColor: Colors.transparent,
          //   shadowColor: Colors.transparent,
          //   title: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child:
          //
          //   ),
          // ),
          bottomNavigationBar: CustomBottomBar(
            selectedIndex: _index,
            items: [
              BottomBarItem(
                icon: Image.asset(
                  'assets/images/search.png',
                  color: _index == 0 ? Colors.white : null,
                ),
                title: Text('Explore'),
                activeColor: kPrimaryColor,
              ),
              BottomBarItem(
                icon: Image.asset(
                  'assets/images/message.png',
                  color: _index == 1 ? Colors.white : null,
                ),
                title: Text('Chats'),
                activeColor: kPrimaryColor,
              ),
              BottomBarItem(
                icon: Image.asset(
                  'assets/images/person.png',
                  color: _index == 2 ? Colors.white : null,
                ),
                title: Text('Profile'),
                activeColor: kPrimaryColor,
              ),
            ],
            onTap: (value) {
              _index = value;
              pageController.animateToPage(
                value,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutExpo,
              );
              setState(() {});
            },
          ),
          body: SafeArea(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        kGreyColor.withOpacity(0.5),
                        kGreyColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              height: getDeviceSize(context).height * 0.07,
                              width: getDeviceSize(context).width,
                              color: Colors.transparent,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        panelController.open();
                                      }, //TODO Add button
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        height: 30,
                                        width: 81,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.filter_alt,
                                              color: kPrimaryColor,
                                              size: 20,
                                            ),
                                            Text(
                                              'Filters',
                                              style: buildTextStyle(size: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              // fit: StackFit.expand,
                              alignment: Alignment.center,
                              // fit: StackFit.passthrough,
                              children: [
                                if (matchCard.isEmpty)
                                  Center(
                                    child: Text(
                                      'No Matches Nearby!',
                                      style: buildTextStyle(
                                          color: Colors.grey.shade700,
                                          size: 25),
                                    ),
                                  ),
                                // for (var i = 0; i < matchCard.length; i++)
                                if (matchCard.isNotEmpty)
                                  SwapCard(
                                    orientation: AmassOrientation.TOP,
                                    animDuration: 250,
                                    cardController: cardController,
                                    swipeCompleteCallback:
                                        (orientation, index) {
                                      if (orientation ==
                                              CardSwipeOrientation.RIGHT &&
                                          index % 2 == 0) {
                                        Navigator.of(context)
                                            .pushNamed(MatchDialogPage.Route);
                                        // matchCard.removeAt(index);
                                      }
                                    },
                                    maxWidth: getDeviceSize(context).width,
                                    maxHeight:
                                        getDeviceSize(context).height * 0.8,
                                    minWidth:
                                        getDeviceSize(context).width * 0.75,
                                    minHeight:
                                        getDeviceSize(context).height * 0.6,
                                    cardBuilder: (context, index) {
                                      return OpenContainer(
                                        openShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0)),
                                        closedShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        transitionDuration:
                                            Duration(milliseconds: 800),
                                        closedBuilder: (context, action) =>
                                            buildSingleCard(false, context,
                                                matchCard[index]),
                                        openBuilder: (context, action) {
                                          return SingleCardPage();
                                        },
                                      );
                                    },
                                    totalNum: matchCard.length,
                                  )
                                // Row(
                                //   children: [
                                //     DragTarget(
                                //       onWillAccept: (data) {
                                //         return false;
                                //       },
                                //       builder:
                                //           (context, candidateData, rejectedData) {
                                //         return Visibility(
                                //           visible: false,
                                //           child: SizedBox(
                                //             width: 10,
                                //             height: double.infinity,
                                //           ),
                                //         );
                                //       },
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.only(top: i.toDouble()),
                                //       child:
                                //           buildProfileCard(context, matchCard[i]),
                                //     ),
                                //     DragTarget(
                                //       onWillAccept: (data) {
                                //         return false;
                                //       },
                                //       builder:
                                //           (context, candidateData, rejectedData) {
                                //         return Visibility(
                                //           visible: false,
                                //           child: SizedBox(
                                //             width: 10,
                                //           ),
                                //         );
                                //       },
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            value = !value;
                          });
                        }, //TODO add Button

                        child: Stack(
                          textDirection: TextDirection.rtl,
                          children: [
                            for (double i = 2; i >= 0; i--)
                              buildProfileDropdownWidget(
                                  value ? (10 + 60 * i) : 10, (i + 1).toInt()),
                            // buildProfileDropdownWidget(70),
                            // buildProfileDropdownWidget(130),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MatchesChatPage(),
                ProfilePage(),
              ],
            ),
          )),
    );
  }

  TextStyle shadowTextStyle({
    Color? color,
    FontWeight? weight,
    double? size,
  }) {
    return TextStyle(
        color: color ?? kDarkPinkColor,
        fontWeight: weight ?? FontWeight.normal,
        fontSize: size ?? 15,
        shadows: [
          Shadow(
            color: Colors.black38,
            blurRadius: 2,
          )
        ]);
  }

  AnimatedContainer buildProfileDropdownWidget(
      [double? verticalMargin, int i = 1]) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      margin:
          EdgeInsets.symmetric(horizontal: 10, vertical: verticalMargin ?? 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      height: 50,
      width: 90,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage('assets/images/dogs/dog$i.jpeg')),
            if (verticalMargin == 10)
              AnimatedOpacity(
                duration: Duration(milliseconds: 10),
                opacity: verticalMargin == 10 ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Icon(
                    Icons.expand_more,
                    color: kPrimaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileCard(BuildContext context, MatchCard match) {
    var dragging = false;
    if (matchCard.indexOf(match) != matchCard.length - 1)
      return buildSingleCard(dragging, context, match);

    return Draggable(
      onDragStarted: () {},
      onDragUpdate: (details) {
        dx += 10;
        setState(() {});
      },
      feedback: buildSingleCard(dragging, context, match),
      data: match,
      childWhenDragging: Container(),
      child: GestureDetector(
        // onHorizontalDragStart: (details) {
        //   dx = details.localPosition.dx;
        //   dragging = true;
        //   prevDx = dx;
        //   print(details.localPosition.distance);
        //   print('Horizontal-drag: ${details.localPosition}');
        // },
        // onHorizontalDragUpdate: (details) {
        //   setState(() {
        //     dx = (details.localPosition.dx - prevDx) / 10;
        //   });
        // },
        // onHorizontalDragEnd: (details) {
        //   print(dx);
        //   if (dx < -18) {
        //     matchCard.removeWhere((element) => element == match);
        //     dx = 0;
        //     setState(() {});
        //   }
        //   if (dx > 18) {
        //     if (matchCard.indexOf(match) % 2 == 0) {
        //       Navigator.of(context).pushNamed(MatchDialogPage.Route);
        //     }
        //     matchCard.removeWhere((element) => element == match);
        //     dx = 0;
        //     setState(() {});
        //   }
        //   setState(() {
        //     dragging = false;
        //     dx = 0;
        //     prevDx = 0;
        //   });
        // },
        child: Transform.rotate(
          angle: 0,
          origin: Offset(0, -getDeviceSize(context).height + 250),
          // angle: !animating
          //     ? math.pi / 180 * dx
          //     : (math.pi / 180 * 45 * animationController.value) *
          //         (left ? -1 : 1),
          // alignment: Alignment.bottomCenter,
          child: buildSingleCard(dragging, context, match),
        ),
      ),
    );
  }

  Widget buildSingleCard(bool dragging, BuildContext context, MatchCard match) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFAFAFA),
            boxShadow: dragging
                ? [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5, 0),
                      blurRadius: 5,
                      spreadRadius: 2,
                    )
                  ]
                : []),
        // height: getDeviceSize(context).height * 0.75,
        // width: getDeviceSize(context).width - 20,
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.white,
                    ),
                    height: getDeviceSize(context).height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image(
                          image: AssetImage(
                              match.imageUrl), //TODO Add image Accordingly
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 0,
                    child: Container(
                      height: 105,
                      width: 331,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(0))),
                      child: Column(
                        // mainAxisAlignment:
                        //    // MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  '${match.name},', // TODO: add name
                                  style: buildTextStyle(
                                      size: 26, color: Colors.grey.shade500),
                                ),
                                Text(
                                  ' 23', // TODO: Add age
                                  style: buildTextStyle(
                                      size: 26, color: Colors.grey.shade500),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                match.breedName +
                                    (matchCard.indexOf(match))
                                        .toString(), // TODO: add Breed name
                                style: buildTextStyle(
                                    size: 19,
                                    color: Colors.black.withOpacity(0.55)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0)),
                  color: Colors.white,
                  //color: Color(0xFAFAFA)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        cardController.triggerLeft();
                        // left = true;
                        // animating = true;
                        // animationController.forward().then((value) {
                        //   animationController.reset();
                        //   matchCard.removeWhere((element) => element == match);
                        //   setState(() {
                        //     animating = false;
                        //   });
                        // });
                      }, //TODO add button
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(4, 2),
                                  color: Colors.grey.shade400,
                                  blurRadius: 5,
                                  spreadRadius: 3)
                            ],
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Icon(
                          Icons.close,
                          color: Colors.grey[500],
                          size: 26,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cardController.triggerRight();
                        // left = false;
                        // animating = true;
                        // animationController.forward().then((value) {
                        //   animationController.reset();
                        //   if (matchCard.indexOf(match) % 2 == 0) {
                        //     Navigator.of(context)
                        //         .pushNamed(MatchDialogPage.Route);
                        //   }
                        //   matchCard.removeWhere((element) => element == match);
                        //   setState(() {
                        //     animating = false;
                        //   });
                        // });
                        // Navigator.of(context)
                        //     .pushNamed(MatchDialogPage.Route);
                      }, //TODO add button
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(4, 2),
                                  color: Colors.grey.shade400,
                                  blurRadius: 5,
                                  spreadRadius: 3)
                            ],
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Icon(
                          Icons.favorite,
                          color: kPrimaryColor,
                          size: 26,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
