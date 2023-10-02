import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/helper/String.dart';
import 'package:petcare/model/Order_Model.dart';
import 'package:petcare/model/SubCategoryModel.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatefulWidget {
  final OrderModel orderDetails;
  OrderDetailPage({super.key, required this.orderDetails});

  @override
  _OrderDetailPage createState() {
    return _OrderDetailPage();
  }
}

class _OrderDetailPage extends State<OrderDetailPage>
    with SingleTickerProviderStateMixin {
  List<OrderItem> myOrderList = [];
  // List<OrderModel> myOrderList = [];

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget onDelivery() {
    // double imageSize = SizeConfig.safeBlockVertical * 10;
    // double imageHeight = SizeConfig.safeBlockVertical * 8;
    double cellHeight = SizeConfig.safeBlockHorizontal! * 20;
    double imageSize = Constants.getPercentSize(cellHeight, 75);

    return Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: myOrderList.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: cardColor,
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: shadowColor,
                    //       blurRadius: 2
                    //   )
                    // ]
                  ),
                  margin:
                      EdgeInsets.all(Constants.getPercentSize(cellHeight, 3)),
                  padding: EdgeInsets.symmetric(
                      vertical: Constants.getPercentSize(cellHeight, 3),
                      horizontal: Constants.getPercentSize(cellHeight, 13)),
                  height: cellHeight,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 0.3,
                      //   color: subTextColor,
                      //   margin: EdgeInsets.only(bottom: 15, top: 15),
                      // ),
                      Row(
                        children: [
                          Container(
                            height: imageSize,
                            width: imageSize,
                            margin: EdgeInsets.only(
                                right: SizeConfig.safeBlockHorizontal! * 0.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: cellColor,
                              image: DecorationImage(
                                  image: AssetImage(Constants.assetsImagePath +
                                      'credit_card.png'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    Constants.getPercentSize(imageSize, 5)),
                              ),
                            ),
                          ),
                          getHorizonSpace(SizeConfig.safeBlockHorizontal! * 2),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: getCustomText(
                                          myOrderList[index].name ?? "",
                                          textColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.w500,
                                          Constants.getPercentSize(
                                              cellHeight, 16)),
                                    ),
                                    new Spacer(),
                                    getCustomText(
                                        S.of(context).quantity + ": ",
                                        textColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w500,
                                        Constants.getPercentSize(
                                            cellHeight, 16)),
                                    getCustomText(
                                        "2",
                                        accentColors,
                                        1,
                                        TextAlign.start,
                                        FontWeight.bold,
                                        Constants.getPercentSize(
                                            cellHeight, 16)),
                                  ],
                                ),
                                getCustomText(
                                    INDIAN_RS_SYM +
                                        myOrderList[index].price.toString(),
                                    textColor,
                                    1,
                                    TextAlign.start,
                                    FontWeight.bold,
                                    Constants.getPercentSize(cellHeight, 18)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.brightness_1,
                                      color: primaryTextColor,
                                      size: Constants.getPercentSize(
                                          cellHeight, 12),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: getCustomText(
                                          myOrderList[index].status ?? "",
                                          primaryTextColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.w500,
                                          Constants.getPercentSize(
                                              cellHeight, 14)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            flex: 1,
                          )
                        ],
                      ),

                      //   ],
                      // )
                    ],
                  ),
                ),
                onTap: () {},
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    myOrderList = widget.orderDetails.itemList ?? [];
    SizeConfig().init(context);
    double totalHeight = SizeConfig.safeBlockVertical! * 100;
    double fontSizeTitle = Constants.getPercentSize1(totalHeight, 2.3);
    double fontSizeLarge = Constants.getPercentSize1(totalHeight, 2.2);
    double leftMargin = MediaQuery.of(context).size.width * 0.05;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ConstantColors.bgColor,
            title: getCustomTextWithoutAlign(
                S.of(context).orderDetail, textColor, FontWeight.bold, 18),
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
            margin: EdgeInsets.only(left: leftMargin, right: leftMargin),
            padding:
                EdgeInsets.only(top: Constants.getPercentSize(totalHeight, 4)),
            child: ListView(
              children: [
                Row(
                  children: [
                    getCustomText(S.of(context).orderId + ": ", textColor, 1,
                        TextAlign.start, FontWeight.w500, fontSizeTitle),
                    getCustomText(widget.orderDetails.id ?? "", accentColors, 1,
                        TextAlign.start, FontWeight.bold, fontSizeTitle),
                    new Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.timelapse_outlined,
                        size: 15,
                        color: textColor,
                      ),
                    ),
                    getCustomText(
                        getFormatedDate(widget.orderDetails.dateTime ?? ""),
                        textColor,
                        1,
                        TextAlign.start,
                        FontWeight.w500,
                        fontSizeTitle),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      getCustomText(S.of(context).items + ": ", textColor, 1,
                          TextAlign.start, FontWeight.w500, fontSizeTitle),
                      getCustomText(myOrderList.length.toString(), accentColors,
                          1, TextAlign.start, FontWeight.bold, fontSizeTitle),
                    ],
                  ),
                ),
                onDelivery(),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: Constants.getPercentSize(totalHeight, 2),
                //       bottom: Constants.getPercentSize1(totalHeight, 0.7)),
                //   child: getCustomTextWithoutMax(
                //       S.of(context).lorem_text,
                //       textColor,
                //       TextAlign.start,
                //       FontWeight.w500,
                //       fontSizeLarge),
                // ),
                // getCustomText(
                //     "$NAME: ${widget.orderDetails.invoice}",
                //     textColor,
                //     1,
                //     TextAlign.start,
                //     FontWeight.w500,
                //     fontSizeTitle),
                getSpace(Constants.getPercentSize1(totalHeight, 1)),
                Row(
                  children: [
                    getCustomText(S.of(context).toatalamount, accentColors, 1,
                        TextAlign.start, FontWeight.bold, fontSizeLarge),
                    new Spacer(),
                    getCustomText(
                        INDIAN_RS_SYM + widget.orderDetails.total.toString(),
                        accentColors,
                        1,
                        TextAlign.start,
                        FontWeight.bold,
                        fontSizeLarge),
                  ],
                ),
                getSpace(Constants.getPercentSize1(totalHeight, 1)),
                getCustomText("Invoice", accentColors, 1, TextAlign.center,
                    FontWeight.bold, fontSizeLarge),
                Html(data: widget.orderDetails.invoice),

                // getCustomText("12", textColor, 1, TextAlign.start,
                //     FontWeight.w500, fontSizeTitle),
                Container(
                  height: 0.3,
                  color: subTextColor,
                  margin: EdgeInsets.only(
                      bottom: Constants.getPercentSize1(totalHeight, 0.8),
                      top: Constants.getPercentSize(totalHeight, 2)),
                  // margin: EdgeInsets.only(bottom: 15, top: 15),
                ),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  String getFormatedDate(String s) {
    return s.split(" ")[0];
  }
}
