import 'package:flutter/material.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/data/PrefData.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/AddressModel.dart';
import 'package:petcare/model/CardModel.dart';
import 'package:petcare/screen/RateProduct.dart';

import '../tab/TabOrder.dart';

class AdoptionThankYouPage extends StatefulWidget {
  @override
  _AdoptionThankYouPage createState() {
    return _AdoptionThankYouPage();
  }
}

class _AdoptionThankYouPage extends State<AdoptionThankYouPage> {
  AddressModel addressList = DataFile.getAddressList()[0];
  CardModel cardList = DataFile.getCardList()[0];

  int currentStep = 0;
  int getSelectedCat = Constants.NONE_CAT;

  Future<void> _getSelectedCat() async {
    getSelectedCat = await PrefData.getSelectedMainCategory();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    cardList = DataFile.getCardList()[0];
    addressList = DataFile.getAddressList()[0];
    _getSelectedCat();
    setState(() {});
  }

  Future<bool> _requestPop() {
    // Navigator.of(context).pop();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen(0)));

    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = MediaQuery.of(context).size.width * 0.05;
    double size = SizeConfig.safeBlockVertical! * 30;
    double screenHeight = SizeConfig.safeBlockVertical! * 100;
    double screenWidth = SizeConfig.safeBlockHorizontal! * 100;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ConstantColors.bgColor,
            title: Text(""),
            automaticallyImplyLeading: false,
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(
            //       Icons.close,
            //       color: Colors.black87,
            //     ),
            //     onPressed: () {
            //       _requestPop();
            //     },
            //   )
            // ],
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        size: size,
                        color: accentColors,
                      ),
                      getCustomText(
                          (getSelectedCat == Constants.GROOMING_ID)
                              ? "Your appointment has\n been booked"
                              : (getSelectedCat == Constants.PET_WALKER_ID)
                                  ? "Your hotel booking has\nbeen placed"
                                  : (getSelectedCat == Constants.SHOPPING_ID)
                                      ? "Your order has\n been booked"
                                      : "Your submission has\n been sent",
                          textColor,
                          2,
                          TextAlign.center,
                          FontWeight.w500,
                          Constants.getPercentSize1(screenHeight, 3)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                Constants.getPercentSize1(screenWidth, 10),
                            vertical: 10),
                        child: getCustomTextWithoutMax(
                            (getSelectedCat == Constants.GROOMING_ID)
                                ? "Thank you for your order. We will be waiting for you and your furry friend."
                                : (getSelectedCat == Constants.PET_WALKER_ID)
                                    ? "Thank you for your order. We impatiently wait to take care of your pet."
                                    : (getSelectedCat == Constants.SHOPPING_ID)
                                        ? "Thank you for your order. We will be waiting for you and your furry friend."
                                        : "Thank you for your interest in adopting our furry friend.We will review your submission and inform you in 3 days.",
                            primaryTextColor,
                            TextAlign.center,
                            FontWeight.w400,
                            Constants.getPercentSize1(screenHeight, 2.2)),
                      ),
                      Visibility(
                          visible: (getSelectedCat == Constants.SHOPPING_ID)
                              ? true
                              : false,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TabOrder(),
                              ));
                            },
                            child: Text(
                              "Track Order",
                              style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                          ))
                    ],
                  ),
                  flex: 1,
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.all(leftMargin),
                      height: 50,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: InkWell(
                        child: Center(
                          child: getCustomTextWithoutAlign(
                              S.of(context).continueStr,
                              Colors.white,
                              FontWeight.w900,
                              15),

                          // child: Text(
                          //   S.of(context).continueShopping,
                          //   style: TextStyle(
                          //       fontFamily: ConstantData.fontFamily,
                          //       fontWeight: FontWeight.w900,
                          //       fontSize: ConstantData.font15Px,
                          //       color: Colors.white,
                          //       decoration: TextDecoration.none),
                          // ),
                        ),
                      )),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RateProduct()));
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
}
