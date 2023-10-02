import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/customwidget/ReviewSlider.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/AddressModel.dart';
import 'package:petcare/model/CardModel.dart';
import 'package:petcare/model/ModelAdoption.dart';
import 'package:petcare/model/ModelTreatment.dart';
import 'package:petcare/screen/AdoptionThankYouPage.dart';
import 'package:petcare/screen/CouponList.dart';

class HotelConfirmationPage extends StatefulWidget {
  @override
  _HotelConfirmationPage createState() {
    return _HotelConfirmationPage();
  }
}

class _HotelConfirmationPage extends State<HotelConfirmationPage> {
  AddressModel addressList = DataFile.getAddressList()[0];
  CardModel cardList = DataFile.getCardList()[0];
  ModelAdoption adoptionModel = DataFile.getAllAdoptionList()[0];
  ModelTreatment _modelTreatment = DataFile.getAllTreatmentList()[0];
  int currentStep = 0;
  TextEditingController _pinEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cardList = DataFile.getCardList()[0];
    addressList = DataFile.getAddressList()[0];
    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  String coupon = "";

  Widget getBookingDetailRow(String title, String des) {
    double screenHeight = SizeConfig.safeBlockVertical! * 100;

    return Row(
      children: [
        getCustomText(title, primaryTextColor, 1, TextAlign.start,
            FontWeight.w400, Constants.getPercentSize1(screenHeight, 1.8)),
        Expanded(
          child: getCustomText(des, primaryTextColor, 1, TextAlign.end,
              FontWeight.w600, Constants.getPercentSize1(screenHeight, 1.8)),
          flex: 1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = MediaQuery.of(context).size.width * 0.05;
    double padding = 15;
    double screenHeight = SizeConfig.safeBlockVertical! * 100;
    double screenWidth = SizeConfig.safeBlockHorizontal! * 100;
    double containerHeight = Constants.getPercentSize1(screenWidth, 18);
    double imageSize = Constants.getPercentSize1(containerHeight, 60);

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
            actions: [
              IconButton(
                icon: Icon(
                  Icons.local_offer,
                  color: textColor,
                ),
                onPressed: () {
                  sendToCoupon();
                },
              )
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: leftMargin, right: leftMargin, top: leftMargin),
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
                            initialValue: 2,
                            width: double.infinity,
                            options: [
                              S.of(context).personalInfo,
                              S.of(context).payment,
                              S.of(context).confirmation
                            ]),
                        getCustomText(
                            S.of(context).petDetails,
                            primaryTextColor,
                            1,
                            TextAlign.start,
                            FontWeight.w400,
                            Constants.getPercentSize1(screenHeight, 2)),
                        // getSpace(Constants.getPercentSize1(screenHeight,1.2)),

                        Container(
                          width: double.infinity,
                          height: containerHeight,
                          decoration: new BoxDecoration(
                              color: cardColor,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black12,
                              //     offset: Offset(1, 1),
                              //     blurRadius: 1,
                              //   )
                              // ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(
                              Constants.getPercentSize1(containerHeight, 7)),
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  child: Container(
                                    width: imageSize,
                                    height: imageSize,
                                    child: Image.network(
                                      adoptionModel.profile_img,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                getHorizonSpace(
                                    Constants.getPercentSize1(screenWidth, 3)),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            getCustomText(
                                                adoptionModel.name,
                                                textColor,
                                                1,
                                                TextAlign.start,
                                                FontWeight.bold,
                                                Constants.getPercentSize1(
                                                    containerHeight, 17)),
                                            getCustomText(
                                                adoptionModel.description,
                                                primaryTextColor,
                                                1,
                                                TextAlign.start,
                                                FontWeight.w400,
                                                Constants.getPercentSize1(
                                                    containerHeight, 13)),
                                          ],
                                        ),
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                        getSpace(Constants.getPercentSize1(screenHeight, 3)),
                        getCustomText(
                            S.of(context).pickUpAddress,
                            primaryTextColor,
                            1,
                            TextAlign.start,
                            FontWeight.w400,
                            Constants.getPercentSize1(screenHeight, 2)),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(
                              left: padding,
                              right: padding,
                              top: 20,
                              bottom: 20),
                          decoration: new BoxDecoration(
                              color: cardColor,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black12,
                              //     offset: Offset(1, 1),
                              //     blurRadius: 1,
                              //   )
                              // ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomText(addressList.name ?? "", textColor,
                                  1, TextAlign.center, FontWeight.w700, 14),
                              Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: getCustomText(
                                    addressList.location ?? "",
                                    primaryTextColor,
                                    1,
                                    TextAlign.start,
                                    FontWeight.w500,
                                    12),
                              )
                            ],
                          ),
                        ),

                        getCustomText(
                            S.of(context).paymentMethod,
                            primaryTextColor,
                            1,
                            TextAlign.start,
                            FontWeight.w400,
                            Constants.getPercentSize1(screenHeight, 2)),
                        Container(
                          padding: EdgeInsets.all(padding),
                          decoration: new BoxDecoration(
                              color: cardColor,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black12,
                              //     offset: Offset(1, 1),
                              //     blurRadius: 1,
                              //   )
                              // ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getCustomText(
                                          cardList.name ?? "",
                                          textColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.w700,
                                          12),
                                      Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: getCustomText(
                                            cardList.email ?? "",
                                            primaryTextColor,
                                            1,
                                            TextAlign.start,
                                            FontWeight.w500,
                                            10),
                                      )
                                    ],
                                  ),
                                  new Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 3),
                                      child: Image.asset(
                                          Constants.assetsImagePath +
                                              cardList.image!,
                                          height: 35,
                                          width: 35),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    getCustomText(
                                        S.of(context).cardNo,
                                        primaryTextColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w500,
                                        10),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 40, right: 30),
                                      child: getCustomText(
                                          ":",
                                          primaryTextColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.w500,
                                          10),
                                    ),
                                    Expanded(
                                      child: getCustomText(
                                          cardList.cardNo ?? "",
                                          textColor,
                                          1,
                                          TextAlign.end,
                                          FontWeight.w900,
                                          10),
                                      flex: 1,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          getCustomText(
                                              S.of(context).expDate,
                                              primaryTextColor,
                                              1,
                                              TextAlign.start,
                                              FontWeight.w500,
                                              10),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: getCustomText(
                                                ":",
                                                primaryTextColor,
                                                1,
                                                TextAlign.start,
                                                FontWeight.w500,
                                                10),
                                          ),
                                          Expanded(
                                            child: getCustomText(
                                                cardList.expDate ?? "",
                                                textColor,
                                                1,
                                                TextAlign.end,
                                                FontWeight.w900,
                                                10),
                                            flex: 1,
                                          )
                                        ],
                                      ),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: getCustomText(
                                                S.of(context).cvv,
                                                primaryTextColor,
                                                1,
                                                TextAlign.start,
                                                FontWeight.w500,
                                                10),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: getCustomText(
                                                ":",
                                                primaryTextColor,
                                                1,
                                                TextAlign.start,
                                                FontWeight.w500,
                                                10),
                                          ),
                                          Expanded(
                                            child: getCustomText(
                                                cardList.cVV ?? "",
                                                textColor,
                                                1,
                                                TextAlign.end,
                                                FontWeight.w900,
                                                10),
                                            flex: 1,
                                          )
                                        ],
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        getSpace(Constants.getPercentSize1(screenHeight, 3)),

                        getCustomText(
                            S.of(context).grooming,
                            primaryTextColor,
                            1,
                            TextAlign.start,
                            FontWeight.w400,
                            Constants.getPercentSize1(screenHeight, 2)),
                        Container(
                          width: double.infinity,
                          decoration: new BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(
                              Constants.getPercentSize1(containerHeight, 7)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getBookingDetailRow(
                                  S.of(context).checkin, "Wed 14 Oct,2020"),
                              getBookingDetailRow(
                                  S.of(context).checkout, "Fri 16 Oct,2020"),
                              getBookingDetailRow(S.of(context).serviceType,
                                  S.of(context).pickUp),
                              getCustomText(
                                  S.of(context).additionalTreatment,
                                  primaryTextColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  Constants.getPercentSize1(screenHeight, 1.8)),
                              Container(
                                width: double.infinity,
                                height: containerHeight,
                                margin: EdgeInsets.all(
                                    Constants.getPercentSize1(
                                        containerHeight, 3)),
                                decoration: new BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                padding: EdgeInsets.all(
                                    Constants.getPercentSize1(
                                        containerHeight, 5)),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              Constants.getPercentSize1(
                                                  imageSize, 20)),
                                          width: imageSize,
                                          height: imageSize,
                                          color: lightPrimaryColors,
                                          child: Image.asset(
                                            Constants.assetsImagePath +
                                                _modelTreatment.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      getHorizonSpace(Constants.getPercentSize1(
                                          screenWidth, 3)),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: getCustomText(
                                                            _modelTreatment
                                                                .title,
                                                            textColor,
                                                            1,
                                                            TextAlign.start,
                                                            FontWeight.bold,
                                                            Constants
                                                                .getPercentSize1(
                                                                    containerHeight,
                                                                    18)),
                                                        flex: 1,
                                                      ),
                                                      getCustomText(
                                                          _modelTreatment
                                                                  .currencyCode +
                                                              _modelTreatment
                                                                  .currency
                                                                  .toString(),
                                                          primaryTextColor,
                                                          1,
                                                          TextAlign.start,
                                                          FontWeight.bold,
                                                          Constants
                                                              .getPercentSize1(
                                                                  containerHeight,
                                                                  15))
                                                    ],
                                                  ),
                                                  getCustomText(
                                                      _modelTreatment
                                                          .description,
                                                      primaryTextColor,
                                                      2,
                                                      TextAlign.start,
                                                      FontWeight.w400,
                                                      Constants.getPercentSize1(
                                                          containerHeight, 14)),
                                                ],
                                              ),
                                              flex: 1,
                                            ),
                                          ],
                                        ),
                                        flex: 1,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.only(
                              right: padding,
                              left: padding,
                              top: 15,
                              bottom: 15),
                          decoration: new BoxDecoration(
                              color: cardColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomText(S.of(context).promoCode, textColor,
                                  1, TextAlign.start, FontWeight.w700, 12),
                              Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        maxLines: 1,
                                        controller: _pinEditingController,
                                        style: TextStyle(
                                            fontFamily: Constants.fontsFamily,
                                            color: primaryTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 8),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: textColor),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: disableIconColor),
                                          ),
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                    InkWell(
                                      child: Container(
                                          height: 35,
                                          width: 80,
                                          margin: EdgeInsets.only(
                                              right: 20, left: 15),
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: InkWell(
                                            child: Center(
                                              child: getCustomText(
                                                  S.of(context).apply,
                                                  Colors.white,
                                                  1,
                                                  TextAlign.start,
                                                  FontWeight.w400,
                                                  10),
                                            ),
                                          )),
                                      onTap: () {
                                        sendToCoupon();
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Container(
                  padding: EdgeInsets.all(leftMargin),
                  color: cardColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: getCustomText(
                                S.of(context).subTotal,
                                primaryTextColor,
                                1,
                                TextAlign.start,
                                FontWeight.w600,
                                10),
                            flex: 1,
                          ),
                          getCustomText(":", primaryTextColor, 1,
                              TextAlign.start, FontWeight.w800, 10),
                          Expanded(
                            child: getCustomText(
                                "{INDIAN_RS_SYM}88.10",
                                textColor,
                                1,
                                TextAlign.end,
                                FontWeight.w800,
                                10),
                            flex: 1,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: getCustomText(
                                  S.of(context).shippingFee,
                                  primaryTextColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w600,
                                  10),
                              flex: 1,
                            ),
                            getCustomText(":", primaryTextColor, 1,
                                TextAlign.start, FontWeight.w800, 10),
                            Expanded(
                              child: getCustomText(
                                  "{INDIAN_RS_SYM}9.90",
                                  textColor,
                                  1,
                                  TextAlign.end,
                                  FontWeight.w800,
                                  10),
                              flex: 1,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: getCustomText(
                                S.of(context).estimatingTax,
                                primaryTextColor,
                                1,
                                TextAlign.start,
                                FontWeight.w600,
                                10),
                            flex: 1,
                          ),
                          getCustomText(":", primaryTextColor, 1,
                              TextAlign.start, FontWeight.w800, 10),
                          Expanded(
                            child: getCustomText(
                                "{INDIAN_RS_SYM}6.50",
                                textColor,
                                1,
                                TextAlign.end,
                                FontWeight.w800,
                                10),
                            flex: 1,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        height: 1,
                        color: viewColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: getCustomText(
                                S.of(context).total,
                                primaryTextColor,
                                1,
                                TextAlign.start,
                                FontWeight.w800,
                                12),
                            flex: 1,
                          ),
                          getCustomText(":", primaryTextColor, 1,
                              TextAlign.start, FontWeight.w800, 12),
                          Expanded(
                            child: getCustomText(
                                "{INDIAN_RS_SYM}104.50",
                                textColor,
                                1,
                                TextAlign.end,
                                FontWeight.w800,
                                10),
                            flex: 1,
                          )
                        ],
                      ),
                      InkWell(
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 50,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: InkWell(
                              child: Center(
                                child: getCustomText(
                                    S.of(context).confirmBooking,
                                    Colors.white,
                                    1,
                                    TextAlign.start,
                                    FontWeight.w900,
                                    15),
                              ),
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // builder: (context) => RateProduct()));
                                  builder: (context) =>
                                      AdoptionThankYouPage()));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  void sendToCoupon() {
    Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) => CouponList(),
    ))
        .then((value) {
      if (value != null) {
        print("getval==$value");
        setState(() {
          _pinEditingController.text = value;
        });
      }
    });
  }
}
