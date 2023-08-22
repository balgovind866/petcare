import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' show DateFormat;

class AddNewPet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNewPet();
}

class _AddNewPet extends State<AddNewPet> {
  Widget getTopTitle(String string) {
    return getCustomText(
        string,
        primaryTextColor,
        1,
        TextAlign.start,
        FontWeight.w500,
        Constants.getPercentSize1(SizeConfig.safeBlockHorizontal! * 100, 3.5));
  }

  DateTime currentDate = DateTime.now();

  double screenHeight = SizeConfig.safeBlockVertical! * 100;
  double screenWidth = SizeConfig.safeBlockHorizontal! * 100;

  BoxDecoration getDecorations() {
    return BoxDecoration(
      // color: ConstantColors.bgColor,
      // borderRadius: BorderRadius.all(Radius.circular(10)),
      // border: Border.all(color: Colors.grey.shade700),
      borderRadius: BorderRadius.all(Radius.circular(7)),
      color: cardColor,
      // boxShadow: [
      //   BoxShadow(
      //       color: shadowColor,
      //       blurRadius: 2
      //   )
      // ]
    );
  }

  String dropdownValue = 'Dog';

  List<String> spinnerItems = ['Dog', 'Cat', 'Rabbit'];

  getHintStyle() {
    return TextStyle(
        color: primaryTextColor,
        fontSize: Constants.getPercentSize1(screenWidth, 3),
        fontWeight: FontWeight.w500,
        fontFamily: Constants.fontsFamily);
  }

  getHintDecoration(String string) {
    return InputDecoration(
      hintStyle: getHintStyle(),
      hintText: string,
      border: InputBorder.none,
    );
  }

  XFile? _image;
  final picker = ImagePicker();

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    final ImagePicker _picker = ImagePicker();

    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  int selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double subTextSize = Constants.getPercentSize1(screenWidth, 3);
    double containerHeight = Constants.getPercentSize1(screenWidth, 13);
    double containerHeightDes = Constants.getPercentSize1(screenWidth, 20);
    double containerHeight3 = Constants.getPercentSize1(screenWidth, 12);
    double imageHeight = Constants.getPercentSize1(screenWidth, 42);

    TextStyle style = TextStyle(
        color: textColor,
        fontSize: subTextSize,
        fontWeight: FontWeight.w500,
        fontFamily: Constants.fontsFamily);
    // TextStyle hintStyle = TextStyle(
    //     color: primaryTextColor,
    //     fontSize: subTextSize,
    //     fontWeight: FontWeight.w500,
    //     fontFamily: Constants.fontsFamily);

    // InputDecoration decorationEdt = InputDecoration(
    //   hintStyle: hintStyle,
    //   border: InputBorder.none,
    // );
    Widget space = getSpace(Constants.getPercentSize1(screenHeight, 2));
    return WillPopScope(
      child: Scaffold(
        backgroundColor: ConstantColors.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: textColor,
            ),
            onPressed: () {
              finish();
            },
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: Constants.getPercentSize1(screenWidth, 3)),
          child: ListView(
            children: [
              getCustomText(
                  S.of(context).newPet,
                  textColor,
                  1,
                  TextAlign.start,
                  FontWeight.w500,
                  Constants.getPercentSize1(screenHeight, 3.5)),
              getCustomText(
                  S.of(context).addYourNewFurryFriends,
                  primaryTextColor,
                  1,
                  TextAlign.start,
                  FontWeight.w400,
                  Constants.getPercentSize1(screenHeight, 2.5)),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: imageHeight,
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: lightPrimaryColors,
                    // image: new DecorationImage(
                    //   image: _image == null
                    //       ? AssetImage(
                    //       Constants.assetsImagePath +
                    //           "hugh.png")
                    //       : FileImage(_image),
                    //   fit: BoxFit.cover,
                    // )
                    // borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                  ),
                  child: InkWell(
                    onTap: () {
                      _imgFromGallery();
                    },
                    child: (_image != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image(
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              image: FileImage(
                                new File(_image!.path),
                              ),
                            ),
                          )
                        : Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: Constants.getPercentSize1(
                                      imageHeight, 20),
                                  color: textColor,
                                ),
                                getHorizonSpace(
                                    Constants.getPercentSize1(screenWidth, 4)),
                                getCustomText(
                                    "Add Photo",
                                    textColor,
                                    1,
                                    TextAlign.start,
                                    FontWeight.w500,
                                    Constants.getPercentSize1(imageHeight, 15))
                              ],
                            ),
                          ),
                  ),
                ),
              ),
              getSpace(Constants.getPercentSize1(screenHeight, 1.3)),
              getTopTitle(S.of(context).petName),
              Container(
                height: containerHeight,
                decoration: getDecorations(),
                padding: getPadding(),
                child: TextField(
                  maxLines: 1,
                  style: style,
                  decoration: getHintDecoration(S.of(context).yourBuddyName),
                ),
              ),
              space,
              getTopTitle(S.of(context).typesOfPet),
              Container(
                  width: double.infinity,
                  height: containerHeight,
                  decoration: getDecorations(),
                  padding: getPadding(),
                  child: new Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: cardColor,
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      underline: SizedBox(),
                      elevation: 0,
                      style: getHintStyle(),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.deepPurpleAccent,
                      // ),
                      onChanged: (String? data) {
                        setState(() {
                          dropdownValue = data!;
                        });
                      },
                      items: spinnerItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: getHintStyle(),
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              getSpace(Constants.getPercentSize1(screenHeight, 1.3)),
              getTopTitle(S.of(context).breed),
              Container(
                height: containerHeight,
                decoration: getDecorations(),
                padding: getPadding(),
                child: TextField(
                  maxLines: 1,
                  style: style,
                  decoration: getHintDecoration(S.of(context).breed),
                ),
              ),
              getSpace(Constants.getPercentSize1(screenHeight, 1.3)),
              getTopTitle(S.of(context).birthdate),
              Container(
                height: containerHeight,
                decoration: getDecorations(),
                padding: getPadding(),
                child: InkWell(
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: currentDate,
                      lastDate: DateTime(2050),
                    ).then((pickedDate) {
                      if (pickedDate != null && pickedDate != currentDate)
                        setState(() {
                          currentDate = pickedDate;
                        });
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: getCustomText(
                            DateFormat.yMMMd().format(currentDate),
                            primaryTextColor,
                            1,
                            TextAlign.start,
                            FontWeight.w400,
                            Constants.getPercentSize1(screenHeight, 2)),
                        flex: 1,
                      ),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: primaryTextColor,
                      )
                    ],
                  ),
                ),
              ),
              getSpace(Constants.getPercentSize1(screenHeight, 1.3)),
              getTopTitle(S.of(context).gender),
              Container(
                height: containerHeight3,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedPos = 0;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.getPercentSize(
                                  containerHeight3, 14),
                              vertical: Constants.getPercentSize(
                                  containerHeight3, 7)),
                          decoration: BoxDecoration(
                            color: lightPrimaryColors,
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            border: Border.all(
                                width: 1,
                                color: (selectedPos == 0)
                                    ? accentColors
                                    : Colors.transparent),
                          ),
                          width: double.infinity,
                          height: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomText(
                                  S.of(context).male,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.bold,
                                  Constants.getPercentSize(
                                      containerHeight3, 25)),
                              Visibility(
                                child: Icon(
                                  Icons.check_circle,
                                  color: accentColors,
                                ),
                                visible: (selectedPos == 0) ? true : false,
                              )
                            ],
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    getHorizonSpace(Constants.getPercentSize(screenWidth, 5)),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedPos = 1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.getPercentSize(
                                  containerHeight3, 14),
                              vertical: Constants.getPercentSize(
                                  containerHeight3, 7)),
                          decoration: BoxDecoration(
                              color: lightPrimaryColors,
                              border: Border.all(
                                  width: 1,
                                  color: (selectedPos == 1)
                                      ? accentColors
                                      : Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          width: double.infinity,
                          height: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomText(
                                  S.of(context).female,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.bold,
                                  Constants.getPercentSize(
                                      containerHeight3, 25)),
                              Visibility(
                                child: Icon(
                                  Icons.check_circle,
                                  color: accentColors,
                                ),
                                visible: (selectedPos == 1) ? true : false,
                              )
                            ],
                          ),
                        ),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
              getSpace(Constants.getPercentSize1(screenHeight, 1.3)),
              getTopTitle(S.of(context).weight),
              Container(
                height: containerHeight,
                decoration: getDecorations(),
                padding: getPadding(),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  style: style,
                  decoration: getHintDecoration(S.of(context).weight),
                ),
              ),
              getSpace(Constants.getPercentSize1(screenHeight, 1.3)),
              getTopTitle(S.of(context).description),
              Container(
                height: containerHeightDes,
                decoration: getDecorations(),
                padding: getPadding(),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  style: style,
                  decoration: getHintDecoration(S.of(context).description),
                ),
              ),
              getSpace(Constants.getPercentSize1(screenHeight, 2)),
              getButtonWithColorWithSize(
                  S.of(context).save,
                  accentColors,
                  Constants.getPercentSize1(screenHeight, 1.5),
                  Constants.getPercentSize1(screenHeight, 2.5), () {
                finish();
              }),
              getSpace(Constants.getPercentSize1(screenHeight, 2))
            ],
          ),
        ),
      ),
      onWillPop: () async {
        finish();
        return false;
      },
    );
  }

  void finish() {
    Navigator.of(context).pop();
  }

  getPadding() {
    return EdgeInsets.symmetric(
        horizontal: Constants.getPercentSize1(
            SizeConfig.safeBlockHorizontal! * 100, 2));
  }
}
