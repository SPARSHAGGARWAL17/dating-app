import '../../export.dart';

class MatchDialogPage extends StatefulWidget {
  @override
  _MatchDialogPageState createState() => _MatchDialogPageState();
}

class _MatchDialogPageState extends State<MatchDialogPage> {
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
              Positioned(
                bottom: 40,
                right: 30,
                left: 170,
                top: 180,
                child: Container(
                  // height: 212,
                  // width: 183,
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
                      image: AssetImage('assets/images/dogs/dog5.jpeg'),//TODO add matched Dog Profile Image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 180,
                right: 160,
                left: 30,
                top: 40,
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.28,
                  // width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(15, 20),
                          color: Colors.black26,
                          blurRadius: 3,
                          spreadRadius: 3)
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image(
                      image: AssetImage('assets/images/dogs/dog4.jpeg'),//TODO add matched Dog Profile Image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              buildPositionedHearts(10, 380, 40, 270),
              buildPositionedHearts(350, 50, 69, 250),
              buildPositionedHearts(400, 5, 300, 28),
              buildPositionedHearts(100, 270, 230, 60),
              buildPositionedHearts(195, 195, 146, 166),
            ]),
            Container(
              height: MediaQuery.of(context).size.height * 0.359999,
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
                      context,
                      kPrimaryColor,
                      Center(
                          child: Text(
                        'Send a message',
                        style: buildTextStyle(
                            size: 16,
                            weight: FontWeight.bold,
                            color: Colors.white),
                      ))),
                  buildButton(
                      context,
                      Colors.white,
                      Center(
                          child: Text(
                        'Keep Swiping',
                        style: buildTextStyle(
                            size: 15,
                            weight: FontWeight.bold,
                            color: Colors.black),
                      ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, Color color, Widget child) {
    return InkWell(
      onTap: (){},//TODO Add Button Functionality accordingly
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

  Positioned buildPositionedHearts(
      double bottom, double top, double right, double left) {
    return Positioned(
      bottom: bottom,
      right: right,
      left: left,
      top: top,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Icon(
          Icons.favorite,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
