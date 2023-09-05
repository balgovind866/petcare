import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/Provider/SettingProvider.dart';
import 'package:petcare/Provider/UserProvider.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/helper/String.dart';
import 'package:petcare/model/User.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';

import 'AddNewAddressPage.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePage createState() {
    return _EditProfilePage();
  }
}

class _EditProfilePage extends State<EditProfilePage> {
  List addressList = [];

  int _selectedPosition = 0;

  @override
  void initState() {
    super.initState();

    getAddress();
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

  String? userName, email, mobileNo;

  TextEditingController _textEditingControllerName =
      TextEditingController(text: "");
  // TextEditingController _textEditingControllerLastName =
  //     TextEditingController(text: "Bird");
  TextEditingController _textEditingControllerEmail =
      TextEditingController(text: "email");
  // TextEditingController _textEditingControllerGender =
  //     TextEditingController(text: "Male");
  TextEditingController _textEditingControllerMobile =
      TextEditingController(text: "8759632256");

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<SettingProvider>();
    _textEditingControllerName.text = userData.userName;
    _textEditingControllerEmail.text = userData.email;
    _textEditingControllerMobile.text = userData.mobile;

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
                                          ? Image.memory(_image!.readAsBytes()
                                              as Uint8List)
                                          : (userData.profileUrl != ""
                                              ? Image.network(
                                                  userData.profileUrl)
                                              : RandomAvatar(
                                                  userData.userName))),
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
                                          S.of(context).userName,
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
                          // Expanded(
                          //   child: Column(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(top: 10, left: 8),
                          //         child: Align(
                          //             alignment: Alignment.topLeft,
                          //             child: getCustomText(
                          //                 S.of(context).lastName,
                          //                 textColor,
                          //                 1,
                          //                 TextAlign.start,
                          //                 FontWeight.bold,
                          //                 12)),
                          //       ),
                          //       Container(
                          //         margin: EdgeInsets.only(bottom: 10, left: 8),
                          //         height: editTextHeight,
                          //         child: TextField(
                          //           maxLines: 1,
                          //           controller: _textEditingControllerLastName,
                          //           style: TextStyle(
                          //               fontFamily: Constants.fontsFamily,
                          //               color: primaryTextColor,
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 16),
                          //           decoration: InputDecoration(
                          //             contentPadding:
                          //                 EdgeInsets.only(top: 3, left: 8),
                          //             enabledBorder: UnderlineInputBorder(
                          //               borderSide:
                          //                   BorderSide(color: textColor),
                          //             ),
                          //             focusedBorder: UnderlineInputBorder(
                          //               borderSide:
                          //                   BorderSide(color: disableIconColor),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   flex: 1,
                          // )
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
                          // Expanded(
                          //   child: Column(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(
                          //           top: 10,
                          //         ),
                          //         child: Align(
                          //             alignment: Alignment.topLeft,
                          //             child: getCustomText(
                          //                 S.of(context).gender,
                          //                 textColor,
                          //                 1,
                          //                 TextAlign.start,
                          //                 FontWeight.bold,
                          //                 12)),
                          //       ),
                          //       Container(
                          //         margin: EdgeInsets.only(bottom: 10),
                          //         height: editTextHeight,
                          //         child: TextField(
                          //           controller: _textEditingControllerGender,
                          //           maxLines: 1,
                          //           style: TextStyle(
                          //               fontFamily: Constants.fontsFamily,
                          //               color: primaryTextColor,
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 16),
                          //           decoration: InputDecoration(
                          //             contentPadding:
                          //                 EdgeInsets.only(top: 3, left: 8),
                          //             enabledBorder: UnderlineInputBorder(
                          //               borderSide:
                          //                   BorderSide(color: textColor),
                          //             ),
                          //             focusedBorder: UnderlineInputBorder(
                          //               borderSide:
                          //                   BorderSide(color: disableIconColor),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   flex: 1,
                          // ),
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
                    updateUserData().then((value) =>
                        context.read<UserProvider>().notifyListeners());

                    // Navigator.of(context).pop(true);
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  Future<void> updateUserData() async {
    Map parameter = {
      USER_ID: CUR_USERID,
      EMAIL: _textEditingControllerEmail.text.toString(),
      USERNAME: _textEditingControllerName.text.toString(),
      MOBILE: _textEditingControllerMobile.text.toString(),
      IMAGE: _image
    };
    print("USER_ID: {CUR_USERID}");
    apiBaseHelper.postAPICall(getUpdateUserApi, parameter).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var i = getdata['data'][0];
          print("Updated user data $i");
          String id = i[ID];
          String name = i[USERNAME];
          String email = i[EMAIL];
          String mobile = i[MOBILE];
          String address = i[ADDRESS];
          String image = i[IMAGE];
          CUR_USERID = id;

          // CUR_USERNAME = name;

          UserProvider userProvider = context.read<UserProvider>();
          userProvider.setName(name ?? '');

          SettingProvider settingProvider = context.read<SettingProvider>();
          settingProvider.saveUserDetail(
              id, name, email, mobile, address, '', context);
          setSnackbar("Successfully updated user", context);
        } else {
          setSnackbar(msg!, context);
        }
      },
      onError: (error) {
        setSnackbar(error.toString(), context);
      },
    );
  }

  Future<void> getAddress() async {
    Map parameter = {
      USER_ID: CUR_USERID,
    };
    // print("USER_ID: {CUR_USERID}");
    apiBaseHelper.postAPICall(getAddressApi, parameter).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var data = getdata['data'];
          addressList =
              (data as List).map((data) => User.fromAddress(data)).toList();
          setState(() {});
          setSnackbar(msg!, context);
        } else {
          setSnackbar(msg!, context);
        }
      },
      onError: (error) {
        setSnackbar(error.toString(), context);
      },
    );
  }
}
