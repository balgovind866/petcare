import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/generated/l10n.dart';



class ForgotPasswordPage extends StatefulWidget {
  _ForgotPasswordPage createState() {
    return _ForgotPasswordPage();
  }
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  Future<bool> _requestPop() {
    Navigator.of(context).pop();
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
                  child:
                      getCustomText(S.of(context).setYourPassword, textColor, 1, TextAlign.start, FontWeight.bold, 25),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child:getCustomText(S.of(context).passwordDesc, primaryTextColor, 2, TextAlign.start, FontWeight.w500, 12),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child:getCustomText(S.of(context).emailAddress, textColor, 1, TextAlign.start, FontWeight.bold, 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom
                      : 15),
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
                          borderSide: BorderSide(
                              color: textColor, width: 0.3),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: textColor, width: 0.3),
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
                                child:
                                getCustomText(S.of(context).send, Colors.white, 1, TextAlign.start, FontWeight.w900, 15),
                              ),
                            )),
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                      ),


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
