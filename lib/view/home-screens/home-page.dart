import 'dart:math' as math;
import 'package:bewp_life/model/cards.dart';
import 'package:bewp_life/view/chats/matches-chat.dart';
import 'package:bewp_life/view/home-screens/match-dialog.dart';
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
  bool left = false;
  late AnimationController animationController;
  late Tween<double> tween;
  bool animating = false;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    tween = Tween<double>(begin: 0, end: 1)
      ..animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOutExpo,
        ),
      ).addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor,
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kPrimaryColor,
        elevation: 10.0,
        onTap: (value) {
          _index = value;
          setState(() {});
        },
        currentIndex: _index,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(
              'EXPLORE',
              style:
                  buildTextStyle(size: 10, color: Colors.black.withOpacity(1)),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text(
              'CHAT',
              style:
                  buildTextStyle(size: 10, color: Colors.black.withOpacity(1)),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text(
              'PROFILE',
              style:
                  buildTextStyle(size: 10, color: Colors.black.withOpacity(1)),
            ),
          ),
        ],
      ),
      body: _index == 0
          ? SafeArea(
              child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      height: getDeviceSize(context).height * 0.07,
                      width: getDeviceSize(context).width,
                      color: Colors.transparent,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {}, //TODO add Button
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 30,
                                width: 98,
                                child: Center(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        color: kPrimaryColor,
                                        size: 20,
                                      ),
                                      Text(
                                        'Vadodara', //TODO Add location
                                        style: buildTextStyle(size: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {}, //TODO Add button
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 30,
                                width: 81,
                                child: Row(
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
                  Stack(
                    children: matchCard
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                            child: buildProfileCard(context, e),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ))
          : _index == 1
              ? MatchesChatPage()
              : Container(),
    );
  }

  Widget buildProfileCard(BuildContext context, MatchCard match) {
    var dragging = false;

    return GestureDetector(
      onHorizontalDragStart: (details) {
        dx = details.localPosition.dx;
        dragging = true;
        prevDx = dx;
        print(details.localPosition.distance);
        print('Horizontal-drag: ${details.localPosition}');
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          dx = (details.localPosition.dx - prevDx) / 10;
        });
        if (dx < -25 || dx > 30) {
          matchCard.removeWhere((element) => element == match);
          dx = 0;
          setState(() {});
        }
      },
      onHorizontalDragEnd: (details) {
        print(dx);
        setState(() {
          dragging = false;
          dx = 0;
          prevDx = 0;
        });
      },
      child: Transform.rotate(
        angle: !animating
            ? math.pi / 180 * dx
            : (math.pi / 180 * 45 * animationController.value) *
                (left ? -1 : 1),
        alignment: Alignment.bottomCenter,
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
          height: getDeviceSize(context).height * 0.75,
          width: getDeviceSize(context).width,
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
                            topRight: Radius.circular(15)),
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
                                  match.breedName, // TODO: add Breed name
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
                    color: Colors.white70,
                    //color: Color(0xFAFAFA)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          left = true;
                          animating = true;
                          animationController.forward().then((value) {
                            animationController.reset();
                            matchCard
                                .removeWhere((element) => element == match);
                            setState(() {
                              animating = false;
                            });
                          });
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
                          left = false;
                          animating = true;
                          animationController.forward().then((value) {
                            animationController.reset();
                            if (matchCard.indexOf(match) % 2 == 0) {
                              Navigator.of(context)
                                  .pushNamed(MatchDialogPage.Route);
                            }
                            matchCard
                                .removeWhere((element) => element == match);
                            setState(() {
                              animating = false;
                            });
                          });
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
      ),
    );
  }
}
