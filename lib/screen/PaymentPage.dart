import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/data/PrefData.dart';
import 'package:petcare/screen/ConfirmationPage.dart';
import 'package:petcare/screen/HotelConfirmationPage.dart';
import 'package:petcare/screen/TreatmentConfirmationPage.dart';
import 'package:petcare/screen/AddNewCardPage.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/customwidget/ReviewSlider.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/PaymentModel.dart';
import 'package:petcare/model/CardModel.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPage createState() {
    return _PaymentPage();
  }
}

class _PaymentPage extends State<PaymentPage> {
  List<PaymentModel> paymentList = DataFile.getPaymentList();
  List<CardModel> cardList = DataFile.getCardList();

  int currentStep = 0;
  int _paymentPosition = 0;
  int _cardPosition = 0;

  @override
  void initState() {
    super.initState();
    cardList = DataFile.getCardList();
    paymentList = DataFile.getPaymentList();
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
            // title: Text(S.of(context).checkOut,
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: ConstantData.font18Px,
            //         fontFamily: ConstantData.fontFamily,
            //         color: ConstantData.textColor)),

            title: getCustomTextWithoutMax(S.of(context).payment, textColor,
                TextAlign.start, FontWeight.bold, 18),

            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: textColor,
                  ),
                  onPressed: _requestPop,
                );
              },
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(
                right: leftMargin, left: leftMargin, top: leftMargin),
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
                          initialValue: 1,
                          width: double.infinity,
                          options: [
                            S.of(context).personalInfo,
                            S.of(context).payment,
                            S.of(context).confirmation
                          ]),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: getCustomText(S.of(context).paymentMethods,
                            textColor, 1, TextAlign.start, FontWeight.w800, 15),
                      ),
                      GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 1.8,
                        // crossAxisSpacing: 8,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 8,
                        shrinkWrap: true,
                        children: List.generate(
                          paymentList.length,
                          (index) {
                            return InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: (index == _paymentPosition)
                                      ? primaryColor
                                      : Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(
                                      color: (index == _paymentPosition)
                                          ? primaryColor
                                          : disableIconColor,
                                      width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        Constants.assetsImagePath +
                                            paymentList[index].image!,
                                        height: 25,
                                        width: 25,
                                        color: (index == _paymentPosition)
                                            ? whiteColor
                                            : textColor,
                                      ),
                                      // Image.asset("assets/images/sofa_category.png",height: 20,width: 20),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      // child: Text(
                                      //   paymentList[index].name.toUpperCase(),
                                      //   textAlign: TextAlign.start,
                                      //   style: TextStyle(
                                      //       fontFamily: ConstantData.fontFamily,
                                      //       fontWeight: FontWeight.w500,
                                      //       fontSize: 10,
                                      //       color: (index == _paymentPosition)
                                      //           ? ConstantData.whiteColor
                                      //           : ConstantData.textColor),
                                      // ),

                                      child: getCustomText(
                                          paymentList[index].name!.toUpperCase(),
                                          (index == _paymentPosition)
                                              ? whiteColor
                                              : textColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.w500,
                                          10),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                _paymentPosition = index;
                                setState(() {});
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Row(
                          children: [
                            getCustomText(S.of(context).saveCards, textColor, 1,
                                TextAlign.start, FontWeight.w800, 15),
                            // Text(
                            //   S.of(context).savedCards,
                            //   textAlign: TextAlign.start,
                            //   style: TextStyle(
                            //       fontFamily: ConstantData.fontFamily,
                            //       fontWeight: FontWeight.w800,
                            //       fontSize: ConstantData.font15Px,
                            //       color: ConstantData.textColor),
                            // ),
                            new Spacer(),
                            InkWell(
                              child: getCustomTextWithoutAlign(
                                  S.of(context).newCard.toUpperCase(),
                                  accentColors,
                                  FontWeight.bold,
                                  12),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddNewCardPage()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * 0.01),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cardList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  padding: EdgeInsets.all(8),
                                  decoration: new BoxDecoration(
                                      color: cardColor,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.shade200,
                                      //     blurRadius: 10,
                                      //   )
                                      // ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                              child: Icon(
                                                CupertinoIcons
                                                    .checkmark_alt_circle_fill,
                                                color: (_cardPosition == index)
                                                    ? accentColors
                                                    : Colors.grey.shade400,
                                                size: 25,
                                              ),
                                              onTap: () {
                                                _cardPosition = index;
                                                setState(() {});
                                              }),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "XXXX XXXX XXXX 1234",
                                              style: TextStyle(
                                                  fontFamily:
                                                      Constants.fontsFamily,
                                                  color: textColor,
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 14),
                                            ),
                                          ),
                                          new Spacer(),
                                          Image.asset(
                                            Constants.assetsImagePath +
                                                cardList[index].image!,
                                            width: 25,
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              Constants.assetsImagePath +
                                                  "credit_card.png",
                                              width: 30,
                                              height: 20,
                                              color: accentColors,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                S.of(context).validFrom.toUpperCase(),
                                                style: TextStyle(
                                                    fontFamily:
                                                        Constants.fontsFamily,
                                                    color: textColor,
                                                    fontWeight: FontWeight.bold,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 10),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                cardList[index].expDate??"",
                                                style: TextStyle(
                                                    fontFamily:
                                                        Constants.fontsFamily,
                                                    color: textColor,
                                                    fontWeight: FontWeight.bold,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 2),
                                        child: Row(
                                          children: [
                                            Text(
                                              cardList[index]
                                                  .name!.toUpperCase(),
                                              style: TextStyle(
                                                  fontFamily:
                                                      Constants.fontsFamily,
                                                  color: primaryTextColor,
                                                  fontWeight: FontWeight.w500,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 12),
                                            ),
                                            new Spacer(),
                                            Text(
                                              S.of(context).cvv,
                                              style: TextStyle(
                                                  fontFamily:
                                                      Constants.fontsFamily,
                                                  color: textColor,
                                                  fontWeight: FontWeight.w500,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 14),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 5,
                                                  left: 8,
                                                  bottom: 5,
                                                  right: 8),
                                              margin: EdgeInsets.only(left: 5),
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "789",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          Constants.fontsFamily,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              );
                            }),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: 10, bottom: leftMargin, left: leftMargin),
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
                          //   S.of(context).continueString,
                          //   style: TextStyle(
                          //       fontFamily: ConstantData.fontFamily,
                          //       fontWeight: FontWeight.w900,
                          //       fontSize: ConstantData.font15Px,
                          //       color: Colors.white,
                          //       decoration: TextDecoration.none),
                          // ),
                        ),
                      )),
                  onTap: () async {
                    int i = await PrefData.getSelectedMainCategory();
                    if (i == Constants.TREATMENT_ID) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TreatmentConfirmationPage()));
                    } else if (i == Constants.PET_HOTEL_ID) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HotelConfirmationPage()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmationPage()));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
}
