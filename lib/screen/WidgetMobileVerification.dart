import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/customwidget/CustomDialogBox.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/screen/WidgetNotificationConfirmation.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class WidgetMobileVerification extends StatefulWidget {
  @override
  _WidgetMobileVerification createState() => _WidgetMobileVerification();
}

class _WidgetMobileVerification extends State<WidgetMobileVerification> {
  void finish() {
    Navigator.of(context).pop();
  }

  // bool btnEnable = false;
  final GlobalKey<FormFieldState<String>> _formKey =
      GlobalKey<FormFieldState<String>>(debugLabel: '_formkey');
  TextEditingController _pinEditingController =
      TextEditingController(text: '123');
  bool _enable = true;

  // var _kDefaultHint = 'abcd';
  bool _solidEnable = true;

  // ColorBuilder _solidColor =
  //     PinListenColorBuilder(Colors.grey, Colors.grey[400]);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          // appBar: AppBar(
          //   elevation: 0,
          //   leading: GestureDetector(
          //     onTap: () {
          //       finish();
          //       /* Write listener code here */
          //     },
          //     child: Icon(
          //       Icons.arrow_back_rounded,
          //       color: Colors.black, // add custom icons also
          //     ),
          //   ),
          // ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getSpace(SizeConfig.safeBlockVertical! * 20),
                  getLargeBoldTextWithMaxLine(
                      S.of(context).verify, textColor, 1),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 3,
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal! * 70,
                    child: PinInputTextFormField(
                      key: _formKey,
                      pinLength: 4,
                      decoration: new CirclePinDecoration(
                        bgColorBuilder: _solidEnable
                            ? PinListenColorBuilder(accentColors, Colors.grey)
                            : null,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: Constants.fontsFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        strokeColorBuilder:
                            PinListenColorBuilder(accentColors, Colors.grey),
                        obscureStyle: ObscureStyle(
                          isTextObscure: false,
                          obscureText: '🤪',
                        ),
                        // hintText: _kDefaultHint,
                      ),
                      controller: _pinEditingController,
                      textInputAction: TextInputAction.go,
                      enabled: _enable,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.characters,
                      onSubmit: (pin) {
                        print("gtepin===$pin");
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      onChanged: (pin) {
                        // if (pin == "1234") {
                        //   btnEnable = true;
                        // } else {
                        //   btnEnable = false;
                        // }
                        setState(() {
                          debugPrint('onChanged execute. pin:$pin');
                        });
                      },
                      onSaved: (pin) {
                        debugPrint('onSaved pin:$pin');
                      },
                      validator: (pin) {
                        if (pin!.isEmpty) {
                          setState(() {
                            // _hasError = true;
                          });
                          return 'Pin cannot empty.';
                        }
                        setState(() {
                          // _hasError = false;
                        });
                        return null;
                      },
                      cursor: Cursor(
                        width: 2,
                        color: Colors.white,
                        radius: Radius.circular(1),
                        enabled: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 3,
                  ),

                  getCustomText(
                      S.of(context).weTextedYouACodeToVerifynyourPhoneNumber,
                      primaryTextColor,
                      2,
                      TextAlign.center,
                      FontWeight.w400,
                      15),
                  // getCustomText("Your mobile number", Colors.black87, 1,
                  SizedBox(
                    height: 15,
                  ),
                  getCustomText(S.of(context).didntReceiveCode, textColor, 2,
                      TextAlign.center, FontWeight.w500, 18),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: getRoundCornerBorderButton(S.of(context).resend,
                        Colors.white, Colors.black, Colors.black, 25.0, () {}),
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: getRoundCornerButton(
                        S.of(context).next,
                        accentColors,
                        Colors.white,
                        Icons.arrow_forward_rounded,
                        22.0, () {
                      // if (btnEnable) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              title: S.of(context).accountCreated,
                              descriptions: S
                                  .of(context)
                                  .yourAccountHasnbeenSuccessfullyCreated,
                              text: S.of(context).continueStr,
                              func: () {
                                // Navigator.of(context)
                                //     .push(new MaterialPageRoute(
                                //   builder: (context) => LoginPage(),
                                // ));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WidgetNotificationConfirmation(),
                                    ));
                              },
                            );
                          });

                      // }
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  )

                  // IntlPhoneField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Phone Number',
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(),
                  //     ),
                  //   ),
                  //   initialCountryCode: 'IN',
                  //   onChanged: (phone) {
                  //     print(phone.completeNumber);
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          finish();
          return true;
        });
  }
}
