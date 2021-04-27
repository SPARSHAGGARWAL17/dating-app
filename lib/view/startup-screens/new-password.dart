import '../../export.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Verification Code',
            style: buildTextStyle(
                color: Colors.black, size: 18, weight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('New  Password',
                  textAlign: TextAlign.left,
                  style: buildTextStyle(weight: FontWeight.bold, size: 30)),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Please write your new password',
                  textAlign: TextAlign.left,
                  style: buildTextStyle(weight: FontWeight.w500, size: 18)),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kGreyColor)),
                  labelStyle: buildTextStyle(
                    color: kGreyColor,
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kGreyColor)),
                  labelStyle: buildTextStyle(
                    color: kGreyColor,
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {
                Null;
              },
              child: Container(
                width: double.maxFinite,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: kPrimaryColor,
                ),
                child: Center(
                  child: Text(
                    'Confirm Password',
                    style: buildTextStyle(
                        size: 17, color: Colors.white, weight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
