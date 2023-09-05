import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/ModelAdoption.dart';
import 'package:petcare/model/ModelTreatment.dart';

class OrderDetailTreatmentPage extends StatefulWidget {
  @override
  _OrderDetailTreatmentPage createState() {
    return _OrderDetailTreatmentPage();
  }
}

class _OrderDetailTreatmentPage extends State<OrderDetailTreatmentPage>
    with SingleTickerProviderStateMixin {
  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  ModelAdoption adoptionModel = DataFile.getAllAdoptionList()[0];

  ModelTreatment _modelTreatment = DataFile.getAllTreatmentList()[0];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double totalHeight = SizeConfig.safeBlockVertical! * 100;
    double fontSizeTitle = Constants.getPercentSize1(totalHeight, 2.3);
    double fontSizeLarge = Constants.getPercentSize1(totalHeight, 2.2);
    double leftMargin = MediaQuery.of(context).size.width * 0.05;
    double screenWidth = SizeConfig.safeBlockHorizontal! * 100;

    double containerHeight = Constants.getPercentSize1(screenWidth, 25);
    double imageSize = Constants.getPercentSize1(containerHeight, 60);

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
                    getCustomText("#2CE5DW", accentColors, 1, TextAlign.start,
                        FontWeight.bold, fontSizeTitle),
                    new Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.timelapse_outlined,
                        size: 15,
                        color: textColor,
                      ),
                    ),
                    getCustomText("07/01/2021", textColor, 1, TextAlign.start,
                        FontWeight.w500, fontSizeTitle),
                  ],
                ),
                getCustomText(
                    S.of(context).petDetails,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.bold,
                    Constants.getPercentSize1(totalHeight, 2)),
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(
                      Constants.getPercentSize1(containerHeight, 7)),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          child: Container(
                            width: imageSize,
                            height: imageSize,
                            child: Image.asset(
                              Constants.assetsImagePath +
                                  adoptionModel.image[0],
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        adoptionModel.desc,
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
                getSpace(Constants.getPercentSize1(totalHeight, 3)),
                getCustomText(
                    S.of(context).treatment,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.bold,
                    Constants.getPercentSize1(totalHeight, 2)),
                Container(
                  width: double.infinity,
                  height: containerHeight,
                  decoration: new BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(
                      Constants.getPercentSize1(containerHeight, 7)),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          child: Container(
                            padding: EdgeInsets.all(
                                Constants.getPercentSize1(imageSize, 20)),
                            width: imageSize,
                            height: imageSize,
                            color: lightPrimaryColors,
                            child: Image.asset(
                              Constants.assetsImagePath + _modelTreatment.image,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getCustomText(
                                        _modelTreatment.title,
                                        textColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.bold,
                                        Constants.getPercentSize1(
                                            containerHeight, 14)),
                                    getCustomText(
                                        _modelTreatment.description,
                                        primaryTextColor,
                                        2,
                                        TextAlign.start,
                                        FontWeight.w400,
                                        Constants.getPercentSize1(
                                            containerHeight, 11)),
                                    getCustomText(
                                        _modelTreatment.currencyCode +
                                            _modelTreatment.currency.toString(),
                                        colorOrange,
                                        1,
                                        TextAlign.start,
                                        FontWeight.bold,
                                        Constants.getPercentSize1(
                                            containerHeight, 13))
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
                getSpace(Constants.getPercentSize1(totalHeight, 2)),
                getCustomText(
                    S.of(context).description,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.bold,
                    Constants.getPercentSize1(totalHeight, 2)),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: Constants.getPercentSize1(totalHeight, 0.7)),
                  child: getCustomTextWithoutMax(
                      S.of(context).lorem_text,
                      textColor,
                      TextAlign.start,
                      FontWeight.w400,
                      fontSizeLarge),
                ),
                getCustomText(
                    "Rice ,Alo Borta.Bagon Borta.Vegetables,Beef Curry.Dal.",
                    textColor,
                    1,
                    TextAlign.start,
                    FontWeight.w500,
                    fontSizeTitle),
                Container(
                  height: 0.3,
                  color: subTextColor,
                  margin: EdgeInsets.only(
                      bottom: Constants.getPercentSize1(totalHeight, 0.8),
                      top: Constants.getPercentSize(totalHeight, 2)),
                  // margin: EdgeInsets.only(bottom: 15, top: 15),
                ),
                Row(
                  children: [
                    getCustomText(S.of(context).toatalamount, accentColors, 1,
                        TextAlign.start, FontWeight.bold, fontSizeLarge),
                    new Spacer(),
                    getCustomText("{INDIAN_RS_SYM}24.20", accentColors, 1,
                        TextAlign.start, FontWeight.bold, fontSizeLarge),
                  ],
                ),
                getSpace(Constants.getPercentSize1(totalHeight, 2)),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
}
