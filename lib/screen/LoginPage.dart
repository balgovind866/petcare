import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/Provider/SettingProvider.dart';
import 'package:petcare/Provider/UserProvider.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/PrefData.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/Constant.dart';
import 'package:petcare/screen/ForgotPasswordPage.dart';
import 'package:petcare/screen/RegisterPage.dart';
import 'package:provider/provider.dart';

import '../helper/Session.dart';
import '../helper/String.dart';

class LoginPage extends StatefulWidget {
  _LoginPage createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  Future<bool> _requestPop() {
    // Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 100), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
    return new Future.value(false);
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isNetworkAvail = true;
  String? password,
      mobile,
      username,
      email,
      id,
      mobileno,
      city,
      area,
      pincode,
      address,
      latitude,
      longitude,
      image;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: ConstantColors.bgColor,
            title: Text(""),
            leading: Builder(
              builder: (BuildContext context) {
                return Icon(
                  Icons.keyboard_backspace,
                  color: Colors.transparent,
                );
              },
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.09,
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: getCustomText(S.of(context).signYouIn, textColor, 1,
                      TextAlign.start, FontWeight.bold, 25),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: getCustomText(
                      S.of(context).SignInMsg,
                      primaryTextColor,
                      1,
                      TextAlign.start,
                      FontWeight.w500,
                      15),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: getCustomText(S.of(context).mobileNumberAstrix,
                          textColor, 1, TextAlign.start, FontWeight.bold, 14)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: mobileController,
                    onChanged: (String? value) {
                      mobile = value;
                    },
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: Constants.fontsFamily,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 3, left: 8),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor, width: 0.3),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor, width: 0.3),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15),
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: Constants.fontsFamily,
                            color: textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: getCustomText(S.of(context).password, textColor, 1,
                          TextAlign.start, FontWeight.bold, 14)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextField(
                    controller: passwordController,
                    onChanged: (String? value) {
                      password = value;
                    },
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: Constants.fontsFamily,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 3, left: 8),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor, width: 0.3),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor, width: 0.3),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15),
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: Constants.fontsFamily,
                            color: textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: getCustomText(S.of(context).forgotPassword,
                        textColor, 1, TextAlign.start, FontWeight.bold, 15),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage()));
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                            margin: EdgeInsets.only(top: 40),
                            height: 50,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: InkWell(
                              child: Center(
                                child: getCustomText(
                                    S.of(context).login,
                                    Colors.white,
                                    1,
                                    TextAlign.start,
                                    FontWeight.w900,
                                    15),
                              ),
                            )),
                        onTap: () {
                          PrefData.setIsSignIn(true);
                          validateAndSubmit();
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HomeScreen(0),
                          //     ));
                        },
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getCustomText(
                                S.of(context).donHaveAnAccount,
                                primaryTextColor,
                                1,
                                TextAlign.start,
                                FontWeight.bold,
                                15),
                            getHorizonSpace(5),
                            InkWell(
                              child: Text(
                                S.of(context).register.toUpperCase(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: Constants.fontsFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: textColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
          )),
      onWillPop: _requestPop,
    );
  }

  bool validateAndSave() {
    final form = _formkey.currentState!;
    form.save();
    if (form.validate()) {
      return true;
    }
    return false;
  }

  Future<void> checkNetwork() async {
    _isNetworkAvail = await isNetworkAvailable();
    if (_isNetworkAvail) {
      getLoginUser();
    } else {
      Future.delayed(const Duration(seconds: 2)).then(
        (_) async {
          // await buttonController!.reverse();
          if (mounted) {
            setState(
              () {
                _isNetworkAvail = false;
              },
            );
          }
        },
      );
    }
  }

  void validateAndSubmit() async {
    // if (validateAndSave()) {
    // _playAnimation();
    checkNetwork();
    // }
  }

  Future<void> getLoginUser() async {
    var data = {MOBILE: mobile, PASSWORD: password};
    print("parameter : $data");
    Response response =
        await post(getUserLoginApi, body: data, headers: headers)
            .timeout(const Duration(seconds: timeOut));
    var getdata = json.decode(response.body);
    print("getdata : $getdata");
    bool error = getdata['error'];
    String? msg = getdata['message'];
    // await buttonController!.reverse();
    if (!error) {
      setSnackbar(msg!, context);
      var i = getdata['data'][0];
      id = i[ID];
      username = i[USERNAME];
      email = i[EMAIL];
      mobile = i[MOBILE];
      city = i[CITY];
      area = i[AREA];
      address = i[ADDRESS];
      pincode = i[PINCODE];
      latitude = i[LATITUDE];
      longitude = i[LONGITUDE];
      image = i[IMAGE];

      CUR_USERID = id;
      // CUR_USERNAME = username;

      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      userProvider.setName(username ?? '');
      userProvider.setEmail(email ?? '');
      userProvider.setProfilePic(image ?? '');

      SettingProvider settingProvider =
          Provider.of<SettingProvider>(context, listen: false);

      settingProvider.saveUserDetail(
          id!,username, email, mobile, address, image, context);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen(0)));

      // offFavAdd().then((value) {
      //   db.clearFav();
      //   context.read<FavoriteProvider>().setFavlist([]);
      //   offCartAdd().then((value) {
      //     db.clearCart();
      //     offSaveAdd().then((value) {
      //       db.clearSaveForLater();
      //       Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
      //     });
      //   });
      // });
    } else {
      setSnackbar(msg!, context);
    }
  }
}
