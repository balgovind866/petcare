import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/PrefData.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/screen/ForgotPasswordPage.dart';
import 'package:petcare/screen/RegisterPage.dart';
import 'package:petcare/HomeScreen.dart';

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
                      child: getCustomText(S.of(context).emailAddress,
                          textColor, 1, TextAlign.start, FontWeight.bold, 14)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextField(
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
                  child: Stack(
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

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(0),
                              ));
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
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
}
