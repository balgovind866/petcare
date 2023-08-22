import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/AddressModel.dart';
import 'package:petcare/customwidget/ReviewSlider.dart';
import 'package:petcare/screen/AddNewAddressPage.dart';
import 'package:petcare/screen/PaymentPage.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPage createState() {
    return _CheckOutPage();
  }
}

class _CheckOutPage extends State<CheckOutPage> {
  List<AddressModel> addressList = DataFile.getAddressList();

  int _selectedPosition = 0;
  int currentStep = 0;

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
            title: getCustomText(S.of(context).chekout, textColor, 1,
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
                                                              addressList[index]
                                                                      .name ??
                                                                  "",
                                                              textColor,
                                                              1,
                                                              TextAlign.start,
                                                              FontWeight.w700,
                                                              15),
                                                          getCustomText(
                                                              addressList[index]
                                                                      .location ??
                                                                  "",
                                                              primaryTextColor,
                                                              2,
                                                              TextAlign.start,
                                                              FontWeight.w500,
                                                              15),
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
                  onTap: () {
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
}
