import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/AddressModel.dart';
import 'package:image_picker/image_picker.dart';

import 'AddNewAddressPage.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePage createState() {
    return _EditProfilePage();
  }
}

class _EditProfilePage extends State<EditProfilePage> {
  List<AddressModel> addressList = DataFile.getAddressList();

  int _selectedPosition = 0;

  @override
  void initState() {
    super.initState();
    addressList = DataFile.getAddressList();
    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
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

  TextEditingController _textEditingControllerName =
      TextEditingController(text: "Chloe B");
  TextEditingController _textEditingControllerLastName =
      TextEditingController(text: "Bird");
  TextEditingController _textEditingControllerEmail =
      TextEditingController(text: "chloe_bird@gmail.com");
  TextEditingController _textEditingControllerGender =
      TextEditingController(text: "Male");
  TextEditingController _textEditingControllerMobile =
      TextEditingController(text: "8759632256");

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = MediaQuery.of(context).size.width * 0.05;
    double editTextHeight = MediaQuery.of(context).size.height * 0.06;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ConstantColors.bgColor,
            title: getCustomText(S.of(context).editProfiles, textColor, 1,
                TextAlign.center, FontWeight.bold, 18),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: textColor,
                  ),
                  onPressed: _requestPop,
                );
              },
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(left: leftMargin, right: leftMargin),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                          height: 150.0,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 150,
                                  width: 150,
                                  child: Container(
                                      margin: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,

                                        // image: new DecorationImage(
                                        //   image:(_image!=null)?FileImage(new File(_image!.path)):AssetImage("assetName"),
                                        // (_image == null)
                                        //     ? AssetImage(
                                        //         Constants.assetsImagePath +
                                        //             "hugh.png")
                                        //     : FileImage(new File(_image!.path!)),
                                        // fit: BoxFit.cover,
                                        // )
                                        // borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                                      ),
                                      child: (_image != null)
                                          ? Image(
                                              image: FileImage(
                                                  new File(_image!.path)),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            )
                                          : Image(
                                              image: AssetImage(
                                                  Constants.assetsImagePath +
                                                      "hugh.png"),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity)),
                                ),
                                Positioned(
                                    right: 20,
                                    bottom: 25,
                                    child: InkWell(
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryColor,
                                            // border: Border.all(
                                            //     width: 3,
                                            //     color: ConstantColors.bgColor)
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.photo_camera_back,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: _imgFromGallery,
                                    ))
                              ],
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: getCustomText(
                                S.of(context).userInformation,
                                textColor,
                                1,
                                TextAlign.start,
                                FontWeight.bold,
                                16)),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: getCustomText(
                                          S.of(context).firstName,
                                          textColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          12)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: editTextHeight,
                                  child: TextField(
                                    maxLines: 1,
                                    controller: _textEditingControllerName,
                                    style: TextStyle(
                                        fontFamily: Constants.fontsFamily,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 3, left: 8),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: textColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: disableIconColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 8),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: getCustomText(
                                          S.of(context).lastName,
                                          textColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          12)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10, left: 8),
                                  height: editTextHeight,
                                  child: TextField(
                                    maxLines: 1,
                                    controller: _textEditingControllerLastName,
                                    style: TextStyle(
                                        fontFamily: Constants.fontsFamily,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 3, left: 8),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: textColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: disableIconColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: getCustomText(
                                S.of(context).emailAddressHint,
                                textColor,
                                1,
                                TextAlign.start,
                                FontWeight.bold,
                                12)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: editTextHeight,
                        child: TextField(
                          controller: _textEditingControllerEmail,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: Constants.fontsFamily,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 3, left: 8),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: textColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: disableIconColor),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: getCustomText(
                                          S.of(context).gender,
                                          textColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          12)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: editTextHeight,
                                  child: TextField(
                                    controller: _textEditingControllerGender,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: Constants.fontsFamily,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 3, left: 8),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: textColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: disableIconColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 8),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: getCustomText(
                                          S.of(context).mobileNumber,
                                          textColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          12)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10, left: 8),
                                  height: editTextHeight,
                                  child: TextField(
                                    controller: _textEditingControllerMobile,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: Constants.fontsFamily,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 3, left: 8),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: textColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: disableIconColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            getCustomText(S.of(context).addressTitle, textColor,
                                1, TextAlign.start, FontWeight.w800, 15),
                            new Spacer(),
                            InkWell(
                              child: Text(
                                S.of(context).newAddress.toUpperCase(),
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: textColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Constants.fontsFamily,
                                    fontSize: 12),
                                textAlign: TextAlign.start,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddNewAddressPage()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.01,
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: addressList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Column(
                                  children: [
                                    Container(
                                      height: SizeConfig.safeBlockVertical! * 8,
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        getCustomText(
                                                            addressList[index]
                                                                    .name ??
                                                                "",
                                                            textColor,
                                                            1,
                                                            TextAlign.start,
                                                            FontWeight.w700,
                                                            15),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child: getCustomText(
                                                              addressList[index]
                                                                      .location ??
                                                                  "",
                                                              primaryTextColor,
                                                              1,
                                                              TextAlign.start,
                                                              FontWeight.w500,
                                                              15),
                                                        )
                                                      ],
                                                    ),
                                                    new Spacer(),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 3),
                                                        child: Icon(
                                                          (index ==
                                                                  _selectedPosition)
                                                              ? Icons
                                                                  .radio_button_checked
                                                              : Icons
                                                                  .radio_button_unchecked,
                                                          color: (index ==
                                                                  _selectedPosition)
                                                              ? textColor
                                                              : disableIconColor,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                flex: 1,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      color: viewColor,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  _selectedPosition = index;
                                  setState(() {});
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: leftMargin),
                      height: 50,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: InkWell(
                        child: Center(
                          child: getCustomText(S.of(context).save, Colors.white,
                              1, TextAlign.start, FontWeight.w900, 15),
                        ),
                      )),
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
}
