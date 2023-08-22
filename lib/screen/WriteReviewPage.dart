import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WriteReviewPage extends StatefulWidget {
  @override
  _WriteReviewPage createState() {
    return _WriteReviewPage();
  }
}

class _WriteReviewPage extends State<WriteReviewPage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ConstantColors.bgColor,
            title: getCustomText(S.of(context).writeReviews, textColor, 1,
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
            child: Container(
              margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                  bottom: MediaQuery.of(context).size.width * 0.01),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      Constants.assetsImagePath + 'rate.png',
                      height: SizeConfig.safeBlockVertical! * 25,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Align(
                      alignment: Alignment.center,
                      child: RatingBar.builder(
                        itemSize: 25,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: new BoxDecoration(
                        color: cardColor,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black12,
                        //     offset: Offset(1, 1),
                        //     blurRadius: 1,
                        //   )
                        // ],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: getCustomText(
                                  S.of(context).yourName,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.bold,
                                  12)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: Constants.fontsFamily,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 3, left: 8),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: textColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: disableIconColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: getCustomText(
                                  S.of(context).writeYourReview,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.bold,
                                  12)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: Constants.fontsFamily,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 3, left: 8),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: textColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: disableIconColor),
                              ),
                            ),
                          ),
                        ),
                        getCustomText(S.of(context).minimumCharacters250,
                            textColor, 1, TextAlign.start, FontWeight.w500, 10),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 50,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: InkWell(
                          child: Center(
                              child: getCustomText(
                                  S.of(context).submit,
                                  Colors.white,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w900,
                                  15)),
                        )),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
}
