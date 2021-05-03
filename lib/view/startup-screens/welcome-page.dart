import 'package:bewp_life/const.dart';
import 'package:bewp_life/view/startup-screens/login-email.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomePage extends StatefulWidget {
  static const Route = '/';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  CarouselController carouselController = CarouselController();

  @override
  void dispose() {
    carouselController.stopAutoPlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height: getDeviceSize(context).height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CarouselSlider(
                carouselController: CarouselController(),
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1,
                  height: getDeviceSize(context).height * 0.7,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                ),
                items: [
                  'assets/images/carousel.png',
                  'assets/images/carousel1.jpeg',
                  'assets/images/carousel2.jpeg',
                  'assets/images/carousel3.jpeg',
                  'assets/images/carousel4.jpeg',
                  'assets/images/carousel5.jpeg',
                ].map((i) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      '$i',
                      fit: BoxFit.cover,
                      width: getDeviceSize(context).width * 0.95,
                    ),
                  );
                  // child: Text(
                  //   'text $i',
                  //   style: TextStyle(fontSize: 16.0),
                  // )),
                }).toList(),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomRaisedButton(
                  child: Text(
                    'Get Started',
                    style: buildTextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginEmailPage.Route);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
