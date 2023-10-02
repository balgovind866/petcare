import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/helper/String.dart';
import 'package:petcare/screen/OrderDetailPage.dart';
import 'package:petcare/screen/OrderDetailTreatmentPage.dart';
import 'package:petcare/screen/OrderDetailPetHotel.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/Order_Model.dart';
import 'package:petcare/model/OrderDescModel.dart';
import 'package:petcare/screen/OrderTrackMap.dart';

import '../HomeScreen.dart';

class TabOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabOrder();
}

class _TabOrder extends State<TabOrder> {
  void finish() {
    Navigator.of(context).pop();
  }

  List<String> selectionList = ["Shopping", "Services"];
  int selectedPos = 0;
  // List<OrderModel> allOrderList = DataFile.getOrderList();
  List<OrderModel> allOrderList = [];
  List<OrderModel> allShoppingList = [];
  List<OrderModel> allServicesList = [];

  int expandPosition = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double screenHeight = SizeConfig.safeBlockVertical! * 100;
    double screenWidth = SizeConfig.safeBlockHorizontal! * 100;
    double topSliderHeight = SizeConfig.safeBlockHorizontal! * 13;
    double topSliderWidth = SizeConfig.safeBlockHorizontal! * 24;
    double imageSize = SizeConfig.safeBlockVertical! * 6;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: getCustomText(
                S.of(context).order,
                textColor,
                1,
                TextAlign.start,
                FontWeight.w500,
                Constants.getPercentSize1(screenHeight, 3.5)),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: textColor,
              ),
              onPressed: () {
                finish();
              },
            ),
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: Constants.getPercentSize1(screenWidth, 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getCustomText(
                      S.of(context).listOfYourAllOrders,
                      primaryTextColor,
                      1,
                      TextAlign.start,
                      FontWeight.w400,
                      Constants.getPercentSize1(screenHeight, 2.5)),
                  getSpace(Constants.getPercentSize1(screenHeight, 1.3)),
                  Container(
                    height: topSliderHeight,
                    child: ListView.builder(
                      primary: false,
                      padding: EdgeInsets.all(
                          Constants.getPercentSize1(topSliderWidth, 2)),
                      itemCount: selectionList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedPos = index;
                              if (selectedPos == 0) {
                                allOrderList = allShoppingList;
                              } else if (selectedPos == 1) {
                                allOrderList = allServicesList;
                              }
                            });
                          },
                          child: Container(
                            width: topSliderWidth,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: (selectedPos == index)
                                    ? accentColors
                                    : lightPrimaryColors),
                            // : "#ECEDFA".toColor()),
                            margin: EdgeInsets.all(
                                Constants.getPercentSize1(topSliderWidth, 5)),
                            child: Align(
                              alignment: Alignment.center,
                              child: getCustomText(
                                  selectionList[index],
                                  (selectedPos == index)
                                      ? Colors.white
                                      : accentColors,
                                  1,
                                  TextAlign.center,
                                  FontWeight.w500,
                                  Constants.getPercentSize1(
                                      topSliderHeight, 25)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: allOrderList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: Constants.getPercentSize1(
                                                screenWidth, 1.1),
                                            right: Constants.getPercentSize1(
                                                screenWidth, 1.1)),
                                        child: InkWell(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: imageSize,
                                                width: imageSize,
                                                margin: EdgeInsets.all(15),
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  // color: Constants.getOrderColor(
                                                  //     allOrderList[index]
                                                  //             .activeStatus ??
                                                  //         0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Icon(
                                                  CupertinoIcons.rectangle_dock,
                                                  // color: Constants.getIconColor(
                                                  //     allOrderList[index]
                                                  //         .activeStatus!),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5),
                                                      child: getCustomText(
                                                          S
                                                                  .of(context)
                                                                  .orderId +
                                                              " " +
                                                              allOrderList[
                                                                      index]
                                                                  .id!,
                                                          textColor,
                                                          1,
                                                          TextAlign.start,
                                                          FontWeight.bold,
                                                          15),
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        getCustomText(
                                                            allOrderList![index]
                                                                    .itemList!
                                                                    .length
                                                                    .toString() ??
                                                                "",
                                                            primaryTextColor,
                                                            1,
                                                            TextAlign.start,
                                                            FontWeight.w500,
                                                            15),
                                                        Container(
                                                          height: 8,
                                                          width: 8,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  primaryTextColor),
                                                        ),
                                                        getCustomText(
                                                            allOrderList[index]
                                                                    .itemList?[
                                                                        0]
                                                                    .status ??
                                                                "",
                                                            primaryTextColor,
                                                            1,
                                                            TextAlign.start,
                                                            FontWeight.w500,
                                                            12),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            switch (
                                                                selectedPos) {
                                                              case 0:
                                                                Navigator.of(
                                                                        context)
                                                                    .push(
                                                                        MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      OrderDetailPage(
                                                                          orderDetails:
                                                                              allOrderList[index]),
                                                                ));
                                                                break;
                                                              case 1:
                                                                Navigator.of(
                                                                        context)
                                                                    .push(
                                                                        MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          OrderDetailTreatmentPage(),
                                                                ));
                                                                break;
                                                              case 2:
                                                                Navigator.of(
                                                                        context)
                                                                    .push(
                                                                        MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          OrderDetailPetHotel(),
                                                                ));
                                                                break;
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 5),
                                                            child: getCustomText(
                                                                S
                                                                    .of(context)
                                                                    .orderDetail,
                                                                accentColors,
                                                                1,
                                                                TextAlign.start,
                                                                FontWeight.w500,
                                                                15),
                                                          ),
                                                        ),
                                                        getHorizonSpace(Constants
                                                            .getPercentSize1(
                                                                screenWidth,
                                                                3)),
                                                        // Visibility(
                                                        //     visible:
                                                        //         (selectedPos ==
                                                        //                 0)
                                                        //             ? true
                                                        //             : false,
                                                        //     child: InkWell(
                                                        //       onTap: () {
                                                        //         Navigator.of(
                                                        //                 context)
                                                        //             .push(
                                                        //                 MaterialPageRoute(
                                                        //           builder:
                                                        //               (context) =>
                                                        //                   OrderTrackMap(),
                                                        //         ));
                                                        //       },
                                                        //       child: Padding(
                                                        //         padding: EdgeInsets
                                                        //             .only(
                                                        //                 bottom:
                                                        //                     5),
                                                        //         child: getCustomText(
                                                        //             S
                                                        //                 .of(
                                                        //                     context)
                                                        //                 .trackOrder,
                                                        //             accentColors,
                                                        //             1,
                                                        //             TextAlign
                                                        //                 .start,
                                                        //             FontWeight
                                                        //                 .w500,
                                                        //             15),
                                                        //       ),
                                                        //     )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                flex: 1,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Icon(
                                                  (index == expandPosition)
                                                      ? CupertinoIcons
                                                          .chevron_up
                                                      : CupertinoIcons
                                                          .chevron_down,
                                                  color: primaryTextColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          onTap: () {
                                            if (expandPosition == index) {
                                              expandPosition = -1;
                                            } else {
                                              expandPosition = index;
                                            }

                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      Visibility(
                                        child: Container(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: allOrderList[index]
                                                  .itemList![0]
                                                  .listStatus!
                                                  .length,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10, bottom: 15),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30, right: 30),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: 15,
                                                            width: 15,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 15,
                                                                    top: 3),
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    primaryColor),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              5),
                                                                  child: getCustomText(
                                                                      S.of(context).orderId +
                                                                          " " +
                                                                          (allOrderList[index].itemList?[0].listStatus?[0] ??
                                                                              ""),
                                                                      textColor,
                                                                      1,
                                                                      TextAlign
                                                                          .start,
                                                                      FontWeight
                                                                          .bold,
                                                                      15),
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    getCustomText(
                                                                        (allOrderList[index].itemList?[0].listDate?[0] ??
                                                                            ""),
                                                                        primaryTextColor,
                                                                        1,
                                                                        TextAlign
                                                                            .start,
                                                                        FontWeight
                                                                            .w500,
                                                                        12),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            flex: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {},
                                                );
                                              }),
                                        ),
                                        visible: (index == expandPosition),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        color: subTextColor,
                                        height: 0.5,
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              );
                            })),
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen(3),
          ));
          return false;
        });
  }

  Future<void> getOrders() async {
    Map parameter = {
      USER_ID: CUR_USERID,
    };
    apiBaseHelper.postAPICall(getOrderApi, parameter).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var data = getdata['data'];

          allShoppingList.addAll(
              (data as List).map((json) => OrderModel.fromJson(json)).toList());
          allOrderList = allShoppingList;
          setSnackbar(msg!, context);
        } else {
          setSnackbar(msg!, context);
        }
        setState(() {});
      },
      onError: (error) {
        setState(() {});
        setSnackbar(error.toString(), context);
      },
    );
  }
}
