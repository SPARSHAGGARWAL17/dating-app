import 'package:bewp_life/view/edit-profile/profile-form.dart';
import 'package:flutter/material.dart';
import 'package:bewp_life/export.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(3, 3),
                                spreadRadius: 3,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage('assets/images/dogs/dog1.jpeg'),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(3, 3),
                                  spreadRadius: 3,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xfff8f8f8),
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/pencil.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'WOOF WOOF',
                      style: buildTextStyle(size: 25),
                    ),
                    Text(
                      'Owner Name',
                      style: buildTextStyle(color: kGreyColor),
                    ),
                  ],
                ),
                // color: Colors.red,
              ).expandFlex(2),
              Container(
                padding: EdgeInsets.all(18),
                // height: getDeviceSize(context).height * 0.5,
                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 14,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: tiles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        tiles[index].onPressed(context);
                      },
                      leading: Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(tiles[index].icon),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xfff8f8f8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 0.2,
                                blurRadius: 1,
                                offset: Offset(2, 1),
                              ),
                            ]),
                      ),
                      title: Text(
                        tiles[index].title,
                        style: buildTextStyle(
                            color: Colors.grey.shade700, size: 18),
                      ),
                      trailing: Icon(Icons.navigate_next),
                    );
                  },
                ),
                // color: Colors.green,
              ).expandFlex(3),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileButton {
  Function(BuildContext context) onPressed;
  String title;
  String icon;
  _ProfileButton({
    required this.onPressed,
    required this.title,
    required this.icon,
  });
}

List<_ProfileButton> tiles = [
  _ProfileButton(
    onPressed: (context) {
      Navigator.of(context).pushNamed(ProfileFormPage.Route);
    },
    title: 'Pet Profile',
    icon: 'assets/images/profile.png',
  ),
  _ProfileButton(
    onPressed: (context) {
      Navigator.of(context).pushNamed(RegisterApp.Route);
    },
    title: 'Your Profile',
    icon: 'assets/images/profile.png',
  ),
  _ProfileButton(
    onPressed: (ctx) {},
    title: 'About',
    icon: 'assets/images/star.png',
  ),
  _ProfileButton(
    onPressed: (ctx) {},
    title: 'Settings',
    icon: 'assets/images/setting.png',
  ),
  _ProfileButton(
    onPressed: (ctx) {},
    title: 'Terms & Privacy Policy',
    icon: 'assets/images/paper.png',
  ),
  _ProfileButton(
    onPressed: (ctx) {},
    title: 'Log Out',
    icon: 'assets/images/logout.png',
  ),
];
