import 'package:bewp_life/const.dart';
import 'package:flutter/material.dart';

class SingleCardPage extends StatefulWidget {
  static const Route = '/single-card-page';

  @override
  _SingleCardPageState createState() => _SingleCardPageState();
}

class _SingleCardPageState extends State<SingleCardPage> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        color: Color(0xffF5F5F5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // cardController.triggerLeft();
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
                  color: Colors.black,
                  size: 26,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            InkWell(
              onTap: () {
                // cardController.triggerRight();
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
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Color(0xffFF94A4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                ),
              ],
              backwardsCompatibility: true,
              expandedHeight: getDeviceSize(context).height * 0.45,
              flexibleSpace: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i = 0; i < 4; i++)
                        Container(
                          height: getDeviceSize(context).height * 0.45,
                          width: getDeviceSize(context).width,
                          child: Image.asset(
                            'assets/images/profiles/profile${i + 1}.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      // Image.asset(
                      //   'assets/images/dogs/dog2.jpeg',
                      //   fit: BoxFit.cover,
                      // ),
                      // Image.asset(
                      //   'assets/images/dogs/dog3.jpeg',
                      //   fit: BoxFit.cover,
                      // ),
                      // Image.asset(
                      //   'assets/images/dogs/dog4.jpeg',
                      //   fit: BoxFit.cover,
                      // ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    left: getDeviceSize(context).width / 2 - 65,
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: (currentPage) * (130 / 4),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 10,
                            width: 130 / 4,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      // alignment: Alignment.bottomCenter,
                      height: 10,
                      width: 130,
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Malena Veronica, 23',
                          style: buildTextStyle(size: 30),
                        ),
                        Text(
                          'SHH TZU',
                          style: buildTextStyle(),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15,
                            ),
                            Text('6 Km Away'),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            petQualities(
                              title: '5\'5',
                              subTitle: 'Height',
                            ),
                            petQualities(
                              title: '64 Kg',
                              subTitle: 'Weight',
                            ),
                            petQualities(
                              title: 'Grey',
                              subTitle: 'Hair Color',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'ABOUT ME',
                          style: buildTextStyle(size: 18),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                              'Hey guys, This is XYZ. I’m here to find someone for who can cook for me. I’m not interested in something serious. I would love to hear your adventurous story.'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildPetHabit(
                              title: 'Travel',
                              color: Color(0xffFF6F59),
                            ),
                            buildPetHabit(
                              title: 'Dance',
                              color: Color(0xff32C0FF),
                            ),
                            buildPetHabit(
                              title: 'Fitness',
                              color: Color(0xffFF9932),
                            ),
                            buildPetHabit(
                              title: 'Reading',
                              color: Color(0xff5985FF),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'ARE YOU VACCINATED?',
                          style: buildTextStyle(size: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Yes',
                          style: buildTextStyle(size: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildPetHabit({
    required String title,
    required Color color,
  }) {
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(
      //     horizontal: 10, vertical: 5),
      height: 26,
      width: 80,
      child: Text(
        title,
        style: buildTextStyle(
          color: color,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.withOpacity(0.3),
      ),
    );
  }

  Container petQualities({
    required String title,
    required String subTitle,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 100,
      width: 100,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(1.5, 1.5),
                )
              ],
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(1.5, 1.5),
                )
              ],
              color: Colors.white,
              fontSize: 15,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 2),
            color: Colors.black38,
            spreadRadius: 0.5,
            blurRadius: 1,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFFDDD1),
            Color(0xffFFB6C1),
          ],
        ),
      ),
    );
  }
}
