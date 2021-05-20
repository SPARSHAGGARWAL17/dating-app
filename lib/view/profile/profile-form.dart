import 'dart:io';
import 'dart:async';

import 'package:bewp_life/const.dart';
import 'package:bewp_life/model/cards.dart';
import 'package:bewp_life/model/common/common-model.dart';
import 'package:bewp_life/model/media.dart';
import 'package:bewp_life/utils/custom-buttons.dart';
import 'package:bewp_life/view/profile/profile-popup.dart';
import 'package:bewp_life/view/startup-screens/login-email.dart';
import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart' show OpenContainer;

class ProfileFormPage extends StatefulWidget {
  static const Route = '/profile-form-page';
  @override
  _ProfileFormPageState createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
  // PlatformFile file;
  bool uploading = false;
  bool dragging = false;
  int selected = 1;
  int? pos;
  String currentGender = 'Male';
  List<Media> tmpList = [];

  @override
  void initState() {
    tmpList = [...mediaList];
    super.initState();
  }
  // Future<String> getVideoThumbnail(String videoUrl) async {
  // Directory directory = await getTemporaryDirectory();
  // var videoPath = directory.path;
  // print('video path == $videoPath');
  // var path;
  // try {
  //   path = await VideoThumbnail.thumbnailFile(
  //     video: videoUrl,
  //     imageFormat: ImageFormat.JPEG,
  //     thumbnailPath: videoPath,
  //     maxWidth: 128,
  //     quality: 25,
  //   );
  // } catch (error) {
  //   print(error);
  // }
  // print('thumbnail path == ${path.runtimeType}');
  // return path;
  // }

  // Future<PlatformFile> pickFile() async {
  //   FilePickerResult result = await FilePicker.platform.pickFiles(
  //     allowMultiple: false,
  //     type: FileType.custom,
  //     allowedExtensions: ['mp4', 'jpg', 'jpeg', 'png'],
  //   );
  //   if (result != null) {
  //     file = result.files[0];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: Text(
          'Profile Form',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Colors.black,
              ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: InkWell(
          splashColor: Colors.white,
          onLongPress: () {},
          onTap: () {
            setState(() {
              dragging = false;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      // padding: EdgeInsets.symmetric(horizontal: 15),
                      child: DragAndDropGridView(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: mediaList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        // mainAxisSpacing: 10.0,
                        // crossAxisSpacing: 10.0,
                        onReorder: (oldIndex, newIndex) {
                          mediaList = [...tmpList];
                          int indexOfFirstItem =
                              mediaList.indexOf(mediaList[oldIndex]);
                          int indexOfSecondItem =
                              mediaList.indexOf(mediaList[newIndex]);

                          if (indexOfFirstItem > indexOfSecondItem) {
                            for (int i = mediaList.indexOf(mediaList[oldIndex]);
                                i > mediaList.indexOf(mediaList[newIndex]);
                                i--) {
                              var tmp = mediaList[i - 1];
                              mediaList[i - 1] = mediaList[i];
                              mediaList[i] = tmp;
                            }
                          } else {
                            for (int i = mediaList.indexOf(mediaList[oldIndex]);
                                i < mediaList.indexOf(mediaList[newIndex]);
                                i++) {
                              var tmp = mediaList[i + 1];
                              mediaList[i + 1] = mediaList[i];
                              mediaList[i] = tmp;
                            }
                          }
                          tmpList = [...mediaList];
                          setState(
                            () {
                              pos = null;
                            },
                          );

                          setState(() {});
                        },
                        onWillAccept: (oldIndex, newIndex) {
                          mediaList = [...tmpList];
                          int indexOfFirstItem =
                              mediaList.indexOf(mediaList[oldIndex]);
                          int indexOfSecondItem =
                              mediaList.indexOf(mediaList[newIndex]);

                          if (indexOfFirstItem > indexOfSecondItem) {
                            for (int i = mediaList.indexOf(mediaList[oldIndex]);
                                i > mediaList.indexOf(mediaList[newIndex]);
                                i--) {
                              var tmp = mediaList[i - 1];
                              mediaList[i - 1] = mediaList[i];
                              mediaList[i] = tmp;
                            }
                          } else {
                            for (int i = mediaList.indexOf(mediaList[oldIndex]);
                                i < mediaList.indexOf(mediaList[newIndex]);
                                i++) {
                              var tmp = mediaList[i + 1];
                              mediaList[i + 1] = mediaList[i];
                              mediaList[i] = tmp;
                            }
                          }

                          setState(
                            () {
                              pos = newIndex;
                            },
                          );
                          return true;
                        },

                        itemBuilder: (context, int position) {
                          return Opacity(
                            opacity: pos != null
                                ? pos == position
                                    ? 0.4
                                    : 1
                                : 1,
                            child: new Container(
                              height: 200,
                              // margin: EdgeInsets.all(10),
                              width: 150,
                              // padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
                              decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(new Radius.circular(5.0)),
                              ),
                              //因为本布局和删除图标同处于一个Stack内，设置marginTop和marginRight能让图标处于合适的位置
                              //Because this layout and the delete_Icon are in the same Stack, setting marginTop and marginRight will make the icon in the proper position.
                              child: new ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: buildImage(position),
                              ),
                            ),
                          );
                        },
                        // editChangeListener: () {
                        //   setState(() {});
                        //   print('dragging');
                        //   dragging = false;
                        //   setState(() {});
                        //   // changeActionState();
                        // },
                      )
                      // else {
                      //   return Center(child: CupertinoActivityIndicator());
                      // }
                      ),
                  Container(
                    height: 1100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey),
                            hintText: 'Pet Name',
                            focusColor: Colors.black,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                          ),
                        ),
                        // TextFormField(
                        //   cursorColor: Colors.black,
                        //   keyboardType: TextInputType.number,
                        //   decoration: InputDecoration(
                        //     hintText: 'Age',
                        //     focusColor: Colors.black,
                        //     focusedBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.black),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 240,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: ['Male', 'Female']
                                        .map((e) => Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: buildButton(
                                                  title: e, onPressed: () {}),
                                            ))
                                        .toList()),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Describe your dog',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey),
                            fillColor: kGreyColor.withOpacity(0.2),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        CustomDropDownButton<int>(
                          itemBuilder: (value) => Text('Breed $value'),
                          hintText: 'Select Pet\'s Breed',
                          title: 'Pet Family',
                          selected: selected,
                          onChanged: (value) {
                            selected = value ?? 0;
                            setState(() {});
                          },
                          items: [1, 2, 3, 4],
                        ),
                        CustomDropDownButton<int>(
                          hintText: 'Pet Height',
                          title: 'height',
                          selected: selected,
                          itemBuilder: (value) => Text('${value * 2}\'\' in.'),
                          onChanged: (value) {
                            selected = value ?? 0;
                            setState(() {});
                          },
                          items: [1, 2, 3, 4],
                        ),
                        CustomDropDownButton<int>(
                          hintText: 'Pet Weight',
                          itemBuilder: (value) => Text('${value * 10} Kg.'),
                          title: 'Weight',
                          selected: selected,
                          onChanged: (value) {
                            setState(() {});
                          },
                          items: [1, 2, 3, 4],
                        ),
                        CustomDropDownButton<String>(
                          hintText: 'Select Pet\'s Breed',
                          title: 'Pet Family',
                          selected: '',
                          itemBuilder: (value) => Text(value),
                          onChanged: (value) {
                            setState(() {});
                          },
                          items: [
                            'Brown',
                            'Black',
                            'Red',
                            'White',
                          ],
                        ),
                        // Center(
                        //   child: TextButton(
                        //     onPressed: () {
                        //       // BlocProvider.of<UserMediaCubit>(context)
                        //       //     .loadUserMedia();
                        //     },
                        //     child: Container(
                        //       width: 120,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text(
                        //             'Other Details',
                        //             style: TextStyle(
                        //               color: Colors.pink,
                        //               fontSize: 13,
                        //             ),
                        //           ),
                        //           Icon(
                        //             Icons.navigate_next,
                        //             color: Colors.pink,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Text(
                          'Is your pet vaccinated?',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        Row(
                          children: [
                            buildButton(title: 'Male', onPressed: () {}),
                            SizedBox(width: 20),
                            buildButton(title: 'Female', onPressed: () {}),
                          ],
                        ),
                        CustomDropDownButton<String>(
                          selected: 'selected',
                          items: ['Good', 'Fine', 'Average'],
                          onChanged: (value) {},
                          title: 'Behavior Tags',
                          hintText: 'Select',
                          itemBuilder: (value) => Text(value),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomRaisedButton(
                              child: Text(
                                'Save',
                                style: buildTextStyle(
                                  color: Colors.white,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Image buildImage(int index) {
    return Image.asset(
      '${mediaList[index].longURL}',
      fit: BoxFit.cover,
    );
  }

  FutureBuilder<String> buildVideoThumbnail(List<Media> mediaList, int index) {
    return FutureBuilder<String>(
        // future: getVideoThumbnail(
        //     GlobalConfiguration().get('fileURL') + mediaList[index].longURL),
        builder: (context, snapshot) {
      if (snapshot.hasData)
        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              File(''),
              fit: BoxFit.fill,
            ),
          ),
        );
      else {
        return Container(
          child: CupertinoActivityIndicator(),
        );
      }
    });
  }
}

class CustomDropDownButton<T> extends StatelessWidget {
  CustomDropDownButton({
    Key? key,
    required this.selected,
    required this.items,
    required this.onChanged,
    required this.title,
    required this.hintText,
    required this.itemBuilder,
  }) : super(key: key);

  final T selected;
  final List<T> items;
  final String title;
  final String hintText;
  final Widget Function(T value) itemBuilder;
  final void Function(T? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.grey,
              ),
        ),
        SizedBox(height: 5),
        DropdownButtonFormField<T>(
          onChanged: onChanged,
          onTap: () {
            print("Tapped");
          },
          items: items
              .map(
                (e) => DropdownMenuItem<T>(child: itemBuilder(e), value: e),
              )
              .toList(),
          hint: Text(hintText),
          decoration: InputDecoration(
            filled: true,
            fillColor: kGreyColor.withOpacity(0.2),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 2.5,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 2.5,
              ),
            ),
          ),
        )
      ],
    );
  }
}
