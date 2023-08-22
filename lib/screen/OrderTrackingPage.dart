import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderTrackingPage extends StatefulWidget {
  @override
  _OrderTrackingPage createState() {
    return _OrderTrackingPage();
  }
}

class _OrderTrackingPage extends State<OrderTrackingPage>
    with SingleTickerProviderStateMixin {
  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  Color color1 = accentColors;

  @override
  Widget build(BuildContext context) {
    double imageSize = SizeConfig.safeBlockVertical! * 5;
    double leftMargin = SizeConfig.safeBlockVertical! * 1.8;

    SizeConfig().init(context);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ConstantColors.bgColor,
            title: getCustomTextWithoutAlign(
                "orderTracking", textColor, FontWeight.bold, 18),
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
            margin:
                EdgeInsets.only(top: 10, left: leftMargin, right: leftMargin),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.shade200,
                    //     blurRadius: 10,
                    //   )
                    // ]
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: getCustomText("Delivery Man", textColor, 1,
                                  TextAlign.start, FontWeight.w500, 10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: imageSize,
                                  width: imageSize,
                                  // margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                          Constants.assetsImagePath +
                                              "hugh.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: getCustomText(
                                          "Harry Daniles",
                                          textColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          15),
                                    ),
                                    RatingBar.builder(
                                      itemSize: 15,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      tapOnlyMode: true,
                                      updateOnDrag: true,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 10,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        flex: 1,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.all(10),

                        // margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: cellColor,
                        ),

                        child: InkWell(
                          onTap: () {
                            _callNumber();
                          },
                          child: Icon(
                            Icons.call,
                            color: accentColors,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Timeline(children: items, position: TimelinePosition.center)
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      getTimeLine(
                          true,
                          false,
                          _Child(
                            text: 'Order Accepted',
                            subText: "10:32 am",
                          )),
                      getTimeLine(
                          false,
                          false,
                          _Child(
                            text: 'Preparing package',
                            subText: "10:35 am",
                          )),
                      getTimeLine(
                          false,
                          false,
                          _Child(
                            text: 'On the way',
                            subText: "12:32 pm",
                          )),
                      getTimeLine(
                          false,
                          true,
                          _Child(
                            text: 'Delivered',
                            subText: "4:00 pm",
                          )),
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  void _callNumber() async {
    // launch("tel:"+s);
    // launch("tel://"+s);
    try {
      // ignore: deprecated_member_use
      await launch("tel://214324234");
    } catch (e) {
      print(e);
    }

    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not call $s';
    // }
  }

  TimelineTile getTimeLine(bool isFirst, bool isLast, Widget widget) {
    return TimelineTile(
        alignment: TimelineAlign.start,
        indicatorStyle: IndicatorStyle(
          width: 30,
          height: 30,
          indicator: getCheckWidget(),
        ),
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: accentColors, thickness: 2),
        afterLineStyle: LineStyle(color: accentColors, thickness: 2),
        lineXY: 100,
        endChild: widget);
  }

  Widget mapWidget(String text, String subText) {
    return Container(
      height: SizeConfig.safeBlockVertical! * 30,
      padding: EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getCustomTextWithoutAlign(text, textColor1, FontWeight.w800, 14),
            new Spacer(),
            getCustomText(
                subText, textColor, 1, TextAlign.start, FontWeight.w500, 10)
          ],
        ),
      ),
    );
  }

  Widget getCheckWidget() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: accentColors,
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.checkmark_alt,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class _Child extends StatelessWidget {
  const _Child({
    Key? key,
    this.text,
    this.subText,
    // ignore: unused_element
    this.font = 'Shrikhand',
  }) : super(key: key);
  final String? text;
  final String? subText;
  final String? font;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical! * 6,
      padding: EdgeInsets.only(left: 15),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getCustomTextWithoutAlign(
                text ?? "", textColor, FontWeight.w800, 14),
            new Spacer(),
            getCustomText(subText ?? "", primaryTextColor, 1, TextAlign.start,
                FontWeight.w500, 10)
          ],
        ),
      ),
    );
  }
}
