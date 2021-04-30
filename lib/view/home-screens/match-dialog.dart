import '../../export.dart';

class MatchDialogPage extends StatefulWidget {
  static const Route = '/user-matched-page';
  @override
  _MatchDialogPageState createState() => _MatchDialogPageState();
}

class _MatchDialogPageState extends State<MatchDialogPage> {
  double valueAnimate = 0;
  Duration duration = Duration(milliseconds: 1000);
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      setState(() {
        valueAnimate = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              AnimatedPositioned(
                curve: Curves.bounceInOut,
                duration: duration,
                bottom: 40 * valueAnimate,
                right: 30 * valueAnimate,
                // left: 170,
                // top: 180,
                child: AnimatedOpacity(
                  duration: duration,
                  opacity: valueAnimate,
                  child: Container(
                    height: getDeviceSize(context).height * 0.35,
                    // height: 212,
                    width: getDeviceSize(context).width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(15, 20),
                            color: Colors.black26,
                            blurRadius: 3,
                            spreadRadius: 3)
                      ],
                      color: Colors.blue,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image(
                        image: AssetImage(
                          'assets/images/dogs/dog5.jpeg',
                        ), //TODO add matched Dog Profile Image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: duration,
                left: 30 * valueAnimate,
                top: 40 * valueAnimate,
                child: AnimatedOpacity(
                  duration: duration,
                  opacity: valueAnimate,
                  child: Container(
                    height: getDeviceSize(context).height * 0.35,
                    // height: 212,
                    width: getDeviceSize(context).width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(15, 20),
                          color: Colors.black26,
                          blurRadius: 3,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image(
                        image: AssetImage(
                          'assets/images/dogs/dog4.jpeg',
                        ), //TODO add matched Dog Profile Image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              buildPositionedHearts(
                380,
                40,
              ),
              buildPositionedHearts(
                50,
                69,
              ),
              buildPositionedHearts(
                5,
                300,
              ),
              buildPositionedHearts(
                270,
                230,
              ),
              buildPositionedHearts(
                195,
                146,
              ),
            ]),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'WOOF WOOF',
                    style: buildTextStyle(size: 52, weight: FontWeight.w900),
                  ),
                  buildButton(
                    context: context,
                    onPressed: () {},
                    color: kPrimaryColor,
                    child: Center(
                      child: Text(
                        'Send a message',
                        style: buildTextStyle(
                          size: 16,
                          weight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  buildButton(
                    context: context,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text(
                        'Keep Swiping',
                        style: buildTextStyle(
                            size: 15,
                            weight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    required BuildContext context,
    required Color color,
    required Widget child,
    required Function() onPressed,
  }) {
    return InkWell(
      onTap: onPressed, //TODO Add Button Functionality accordingly
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pink.shade200),
            borderRadius: BorderRadius.circular(5),
            color: color,
            boxShadow: [
              BoxShadow(
                  offset: Offset(3, 4),
                  color: Colors.pink.shade50,
                  blurRadius: 6,
                  spreadRadius: 7)
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  Widget buildPositionedHearts(double top, double right) {
    return AnimatedPositioned(
      duration: duration,
      right: right * valueAnimate,
      top: top * valueAnimate,
      child: AnimatedOpacity(
        duration: duration,
        opacity: valueAnimate,
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: Icon(
            Icons.favorite,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
