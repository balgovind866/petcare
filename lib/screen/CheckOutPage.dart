import 'package:flutter/material.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/Provider/AddressProvider.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/customwidget/ReviewSlider.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/helper/String.dart';
import 'package:petcare/model/User.dart';
import 'package:petcare/screen/AddNewAddressPage.dart';
import 'package:petcare/screen/PaymentPage.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPage createState() {
    return _CheckOutPage();
  }
}

class _CheckOutPage extends State<CheckOutPage> {
  List<User> addressList = [];

  int _selectedPosition = 0;
  int currentStep = 0;

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = MediaQuery.of(context).size.width * 0.05;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ConstantColors.bgColor,
            title: getCustomText(S.of(context).checkout, textColor, 1,
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
            margin: EdgeInsets.only(
                left: leftMargin, right: leftMargin, top: leftMargin),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ReviewSlider(
                          optionStyle: TextStyle(
                            fontFamily: Constants.fontsFamily,
                            fontSize: 8,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          onChange: (index) {},
                          initialValue: 0,
                          width: double.infinity,
                          options: [
                            S.of(context).personalInfo,
                            S.of(context).payment,
                            S.of(context).confirmation
                          ]),
                      Container(
                        child: Row(
                          children: [
                            getCustomText(S.of(context).address, textColor, 1,
                                TextAlign.start, FontWeight.w800, 15),
                            new Spacer(),
                            InkWell(
                              child: Text(
                                S.of(context).newAddress,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                              // getCustomText(
                              //     S.of(context).newAddress.toUpperCase(),
                              //     textColor,
                              //     1,
                              //     TextAlign.start,
                              //     FontWeight.w600,
                              //     12),
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddNewAddressPage()));
                                getAddress();
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
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: addressList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.2,
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
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          getCustomText(
                                                              addressList[index].name ??
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
                                                                        .address ??
                                                                    "",
                                                                primaryTextColor,
                                                                1,
                                                                TextAlign.start,
                                                                FontWeight.w500,
                                                                15),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5),
                                                            child: getCustomText(
                                                                "${addressList[index].area} ${addressList[index].city}",
                                                                primaryTextColor,
                                                                1,
                                                                TextAlign.start,
                                                                FontWeight.w500,
                                                                15),
                                                          )
                                                        ],
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    // new Spacer(),
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
                          child: getCustomText(
                              S.of(context).continueStr,
                              Colors.white,
                              1,
                              TextAlign.start,
                              FontWeight.w900,
                              15),
                        ),
                      )),
                  onTap: () async {
                    await context.read<AddressProvider>().setDefaultAddress(_selectedPosition);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentPage()));
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
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
          context.read<AddressProvider>().setAddressList(addressList);
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
