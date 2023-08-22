import 'dart:async';
import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/PrefData.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/screen/LoginPage.dart';
import 'package:petcare/screen/TermsAndConditionPage.dart';
import 'package:petcare/screen/WidgetMobileVerification.dart';
import 'package:provider/provider.dart';
import '../helper/Session.dart';
import '../helper/Constant.dart';
import '../helper/String.dart';
import '../Provider/SettingProvider.dart';
import '../Provider/UserProvider.dart';

class RegisterPage extends StatefulWidget {
  _RegisterPage createState() {
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage> {
  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(false);
  }

  String countryCode = "IN";
  String mobileNumber = "";
  bool? _showPassword = false;
  bool visible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final ccodeController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  int count = 1;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? email, name = 'hemal', password, mobile, id, countrycode, address;
  FocusNode? nameFocus,
      emailFocus,
      passFocus = FocusNode(),
      referFocus = FocusNode();
  bool _isNetworkAvail = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          key: _scaffoldKey,
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
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            child: ListView(
              children: [
                Container(
                    child: getCustomText(S.of(context).createAnAccount,
                        textColor, 1, TextAlign.start, FontWeight.bold, 25)),
                Container(
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: getCustomText(
                        S.of(context).SignUpMsg,
                        primaryTextColor,
                        1,
                        TextAlign.start,
                        FontWeight.w500,
                        15)),

                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: getCustomText(S.of(context).emailAddress,
                          textColor, 1, TextAlign.start, FontWeight.bold, 14)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocus,
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    validator: (val) => validateEmail(
                        val!,
                        getTranslated(context, 'EMAIL_REQUIRED'),
                        getTranslated(context, 'VALID_EMAIL')),
                    onSaved: (String? value) {
                      email = value;
                    },
                    onFieldSubmitted: (v) {
                      _fieldFocusChange(context, emailFocus!, passFocus);
                    },
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
                  margin: EdgeInsets.only(bottom: 10),
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    obscureText: _showPassword!,
                    controller: passwordController,
                    focusNode: passFocus,
                    textInputAction: TextInputAction.next,
                    validator: (val) => validatePass(
                        val!,
                        getTranslated(context, 'PWD_REQUIRED'),
                        getTranslated(context, 'PWD_LENGTH')),
                    onSaved: (String? value) {
                      password = value;
                    },
                    onFieldSubmitted: (v) {
                      _fieldFocusChange(context, passFocus!, referFocus);
                    },
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

                // Padding(
                //   padding: EdgeInsets.only(bottom: 10),
                //   child: Align(
                //       alignment: Alignment.topLeft,
                //       child: Text(
                //         S.of(context).mobileNumber,
                //         textAlign: TextAlign.start,
                //         style: TextStyle(
                //             fontFamily: Constants.fontsFamily,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 14,
                //             color: textColor),
                //       )),
                // ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7, bottom: 7, right: 7),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: textColor, width: 0.3),
                            color: ConstantColors.bgColor),
                        child: CountryCodePicker(
                          onChanged: (value) {
                            countryCode = value.dialCode!;
                            print("changeval===$countryCode");
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IN',
                          textStyle: TextStyle(
                              color: textColor,
                              fontFamily: Constants.fontsFamily),
                          // favorite: ['+39', 'FR'],
                          // countryFilter: ['IT', 'FR'],
                          showFlagDialog: true,
                          comparator: (a, b) => b.name!.compareTo(a.name!),
                          //Get the country information relevant to the initial selection
                          onInit: (code) {
                            countryCode = code!.dialCode!;
                            print(
                                "on init ${code.name} ${code.dialCode} ${code.name}");
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          margin: EdgeInsets.only(top: 7, bottom: 7, left: 7),
                          decoration: BoxDecoration(
                              // borderRadius:
                              //     BorderRadius.all(Radius.circular(5)),
                              color: ConstantColors.bgColor),
                          child: TextFormField(
                            controller: mobileController,
                            onSaved: (String? value) {
                              mobile = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 3, left: 8),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: textColor, width: 0.3),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(8),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: textColor, width: 0.3),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(15),
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    fontFamily: Constants.fontsFamily,
                                    color: textColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16)),
                            style: TextStyle(
                                fontFamily: Constants.fontsFamily,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 10),
                //   height: MediaQuery.of(context).size.height * 0.07,
                //   child: TextField(
                //     maxLines: 1,
                //     keyboardType: TextInputType.number,
                //     style: TextStyle(
                //         fontFamily: Constants.fontsFamily,
                //         color: primaryTextColor,
                //         fontWeight: FontWeight.w400,
                //         fontSize: 16),
                //     obscureText: true,
                //     decoration: InputDecoration(
                //         contentPadding: EdgeInsets.only(top: 3, left: 8),
                //         enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: textColor, width: 0.3),
                //           borderRadius: const BorderRadius.all(
                //             const Radius.circular(8),
                //           ),
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: textColor, width: 0.3),
                //           borderRadius: const BorderRadius.all(
                //             const Radius.circular(15),
                //           ),
                //         ),
                //         hintStyle: TextStyle(
                //             fontFamily: Constants.fontsFamily,
                //             color: textColor,
                //             fontWeight: FontWeight.w400,
                //             fontSize: 16)),
                //   ),
                // ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: getCustomText(S.of(context).address, textColor, 1,
                          TextAlign.start, FontWeight.bold, 14)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextFormField(
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    controller: addressController,
                    style: TextStyle(
                        fontFamily: Constants.fontsFamily,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    onSaved: (String? value) {
                      address = value;
                    },
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

                Row(
                  children: [
                    ImageIcon(
                      AssetImage(Constants.assetsImagePath + 'checkmark.png'),
                      size: 15,
                      color: textColor,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: getCustomText(
                            S.of(context).iHaveAccept,
                            textColor,
                            1,
                            TextAlign.start,
                            FontWeight.bold,
                            15)),
                    InkWell(
                      child: Text(
                        S.of(context).termsCondition,
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
                                builder: (context) => TermsAndConditionPage()));
                      },
                    )
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: InkWell(
                        child: Center(
                            child: getCustomText(
                                S.of(context).register,
                                Colors.white,
                                1,
                                TextAlign.start,
                                FontWeight.w900,
                                15)),
                      )),
                  onTap: () {
                    // PrefData.setIsSignIn(true);
                    // Navigator.of(context).pop(true);

                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => WidgetMobileVerification(),
                    //     ));
                    getRegisterUser();

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MyHomePage()));
                  },
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getCustomText(
                          S.of(context).haveAnAccount,
                          primaryTextColor,
                          1,
                          TextAlign.start,
                          FontWeight.bold,
                          15),
                      InkWell(
                        child: Text(
                          S.of(context).login.toUpperCase(),
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => LoginPage()));
                          getRegisterUser();
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
      onWillPop: _requestPop,
    );
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      checkNetwork();
    }
  }

  Future<void> checkNetwork() async {
    bool avail = await isNetworkAvailable();
    if (avail) {
      getRegisterUser();
    } else {
      Future.delayed(const Duration(seconds: 2)).then((_) async {
        if (mounted) {
          setState(() {
            _isNetworkAvail = false;
          });
        }
      });
    }
  }

  bool validateAndSave() {
    final form = _formkey.currentState!;
    form.save();
    if (form.validate()) {
      return true;
    }
    return false;
  }

  Future<void> getRegisterUser() async {
    try {
      var data = {
        MOBILE: "mobile",
        NAME: "name",
        EMAIL: "email",
        PASSWORD: "password",
        COUNTRY_CODE: "countrycode",
      };

      Response response =
          await post(getUserSignUpApi, body: data, headers: headers)
              .timeout(Duration(seconds: timeOut));

      var getdata = json.decode(response.body);
      bool error = getdata['error'];
      String? msg = getdata['message'];
      if (!error) {
        setSnackbar(getTranslated(context, 'REGISTER_SUCCESS_MSG')!, context);
        var i = getdata['data'][0];

        id = i[ID];
        name = i[USERNAME];
        email = i[EMAIL];
        mobile = i[MOBILE];
        countrycode = i[COUNTRY_CODE];
        CUR_USERID = id;

        // CUR_USERNAME = name;

        UserProvider userProvider = context.read<UserProvider>();
        userProvider.setName(name ?? '');

        SettingProvider settingProvider = context.read<SettingProvider>();
        settingProvider.saveUserDetail(
            id!, email, mobile, address, '', context);

        // Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        setSnackbar(msg!, context);
      }
      if (mounted) setState(() {});
    } on TimeoutException catch (_) {
      setSnackbar(getTranslated(context, 'somethingMSg')!, context);
    }
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode? nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
