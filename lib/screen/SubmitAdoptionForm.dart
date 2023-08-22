import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/ModelAdoption.dart';
import 'package:petcare/screen/AdoptionThankYouPage.dart';

// ignore: must_be_immutable
class SubmitAdoptionForm extends StatefulWidget {
  ModelAdoption _modelAdoption;

  SubmitAdoptionForm(this._modelAdoption);

  @override
  _SubmitAdoptionForm createState() => _SubmitAdoptionForm();
}

class _SubmitAdoptionForm extends State<SubmitAdoptionForm> {
  int selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenHeight = SizeConfig.safeBlockVertical !* 100;
    double screenWidth = SizeConfig.safeBlockHorizontal !* 100;
    double containerHeight3 = Constants.getPercentSize1(screenWidth, 12);
    double containerHeight4 = Constants.getPercentSize1(screenWidth, 20);
    double containerHeight = Constants.getPercentSize1(screenWidth, 30);
    double containerHeight2 = Constants.getPercentSize1(screenWidth, 18);
    double subContainerHeight = Constants.getPercentSize1(containerHeight, Constants.subContainer);


    return WillPopScope(
      child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined,color: textColor,),
              onPressed: () {
                finish();
              },
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Constants.getPercentSize1(screenWidth, 3)),
            child: ListView(
              children: [
                getCustomText(
                    S.of(context).submission,
                    textColor,
                    1,
                    TextAlign.start,
                    FontWeight.w500,
                    Constants.getPercentSize1(screenHeight, 3.5)),
                getCustomText(
                    S.of(context).fillTheseFormsForAdoptionSubmission,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.w400,
                    Constants.getPercentSize1(screenHeight, 2.5)),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                Container(
                  width: double.infinity,
                  height: containerHeight,
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: cardColor,
                      boxShadow: [
                        BoxShadow(
                            color: shadowColor,
                            blurRadius: 2
                        )
                      ]
                      // border: Border.all(
                      //   color: Colors.grey,
                      // ),
                      // borderRadius: BorderRadius.all(Radius.circular(7))
                  ),
                  padding: EdgeInsets.all(
                      Constants.getPercentSize1(containerHeight, 7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        child: Container(
                          width: Constants.getPercentSize1(containerHeight, 60),
                          height:
                              Constants.getPercentSize1(containerHeight, 60),
                          child: Image.asset(
                            Constants.assetsImagePath +
                                widget._modelAdoption.image[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      getHorizonSpace(
                          Constants.getPercentSize1(screenWidth, 3)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getCustomText(
                                widget._modelAdoption.name,
                                textColor,
                                1,
                                TextAlign.start,
                                FontWeight.bold,
                                Constants.getPercentSize1(containerHeight, 14)),
                            getCustomText(
                                widget._modelAdoption.desc,
                                primaryTextColor,
                                1,
                                TextAlign.start,
                                FontWeight.w400,
                                Constants.getPercentSize1(containerHeight, 11)),
                            getSpace(
                                Constants.getPercentSize1(containerHeight, 2)),
                            Container(
                              height: subContainerHeight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.all(
                                        Constants.getPercentSize1(
                                            subContainerHeight, 4)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        color: lightPrimaryColors),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        getCustomText(
                                            S.of(context).AGE,
                                            primaryTextColor,
                                            1,
                                            TextAlign.center,
                                            FontWeight.w500,
                                            Constants.getPercentSize1(
                                                subContainerHeight, Constants.topTxt)),
                                        getCustomText(
                                            widget._modelAdoption.age,
                                            textColor,
                                            1,
                                            TextAlign.center,
                                            FontWeight.w500,
                                            Constants.getPercentSize1(
                                                subContainerHeight, Constants.bottomTxt))
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.all(
                                        Constants.getPercentSize1(
                                            subContainerHeight, 4)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        color: lightPrimaryColors),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        getCustomText(
                                            S.of(context).SEX,
                                            primaryTextColor,
                                            1,
                                            TextAlign.center,
                                            FontWeight.w500,
                                            Constants.getPercentSize1(
                                                subContainerHeight, Constants.topTxt)),
                                        getCustomText(
                                            widget._modelAdoption.gender,
                                            textColor,
                                            1,
                                            TextAlign.center,
                                            FontWeight.w500,
                                            Constants.getPercentSize1(
                                                subContainerHeight, Constants.bottomTxt))
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.all(
                                        Constants.getPercentSize1(
                                            subContainerHeight, 4)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        color: lightPrimaryColors),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        getCustomText(
                                            S.of(context).WEIGHT,
                                            primaryTextColor,
                                            1,
                                            TextAlign.center,
                                            FontWeight.w500,
                                            Constants.getPercentSize1(
                                                subContainerHeight, Constants.topTxt)),
                                        getCustomText(
                                            widget._modelAdoption.weight,
                                            textColor,
                                            1,
                                            TextAlign.center,
                                            FontWeight.w500,
                                            Constants.getPercentSize1(
                                                subContainerHeight, Constants.bottomTxt))
                                        
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                Container(
                  margin: EdgeInsets.all(2),
                  height: containerHeight2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: cardColor,
                      boxShadow: [
                        BoxShadow(
                            color: shadowColor,
                            blurRadius: 2
                        )
                      ]
                      // border: Border.all(
                      //   color: Colors.grey,
                      // ),
                      // borderRadius: BorderRadius.all(Radius.circular(7))
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          Constants.getPercentSize1(containerHeight2, 10),
                      vertical: Constants.getPercentSize1(containerHeight2, 7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCustomText(
                          "Wendi Valerie",
                          textColor,
                          1,
                          TextAlign.start,
                          FontWeight.w500,
                          Constants.getPercentSize(containerHeight2, 21)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: primaryTextColor,
                                  size: Constants.getPercentSize(
                                      containerHeight2, 19),
                                ),
                                getHorizonSpace(2),
                                getCustomText(
                                    "Wendi@website.com",
                                    primaryTextColor,
                                    1,
                                    TextAlign.start,
                                    FontWeight.w300,
                                    Constants.getPercentSize(
                                        containerHeight2, 19))
                              ],
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: primaryTextColor,
                                  size: Constants.getPercentSize(
                                      containerHeight2, 19),
                                ),
                                getHorizonSpace(2),
                                getCustomText(
                                    "+62 1234 9090 678",
                                    primaryTextColor,
                                    1,
                                    TextAlign.start,
                                    FontWeight.w300,
                                    Constants.getPercentSize(
                                        containerHeight2, 19))
                              ],
                            ),
                            flex: 1,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                getCustomText(
                    S.of(context).livingAddress,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.w400,
                    Constants.getPercentSize1(screenHeight, 2.5)),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                Container(
                  margin: EdgeInsets.all(2),
                  height: containerHeight2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: cardColor,
                      boxShadow: [
                        BoxShadow(
                            color: shadowColor,
                            blurRadius: 2
                        )
                      ]
                      // border: Border.all(
                      //   color: Colors.grey,
                      // ),
                      // borderRadius: BorderRadius.all(Radius.circular(7))
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          Constants.getPercentSize1(containerHeight2, 10),
                      vertical: Constants.getPercentSize1(containerHeight2, 7)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: getCustomText(
                        "1335 Taylor Street\nWhite Plains, New York 10601",
                        primaryTextColor,
                        2,
                        TextAlign.start,
                        FontWeight.w500,
                        Constants.getPercentSize1(containerHeight2, 18)),
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 2.5)),
                getCustomText(
                    S.of(context).haveYouPreviouslyOwnedPets,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.w400,
                    Constants.getPercentSize1(screenHeight, 2.5)),
                getSpace(Constants.getPercentSize1(screenHeight, 1.2)),
                Container(
                  height: containerHeight3,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedPos = 0;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Constants.getPercentSize(
                                    containerHeight3, 14),
                                vertical: Constants.getPercentSize(
                                    containerHeight3, 7)),
                            decoration: BoxDecoration(
                              color: lightPrimaryColors,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              border: Border.all(
                                  width: 1,
                                  color: (selectedPos == 0)
                                      ? accentColors
                                      : Colors.transparent),
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomText(
                                    S.of(context).yes,
                                    textColor,
                                    1,
                                    TextAlign.start,
                                    FontWeight.bold,
                                    Constants.getPercentSize(
                                        containerHeight3, 25)),
                                Visibility(
                                  child: Icon(
                                    Icons.check_circle,
                                    color: accentColors,
                                  ),
                                  visible: (selectedPos == 0) ? true : false,
                                )
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      getHorizonSpace(Constants.getPercentSize(screenWidth, 5)),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedPos = 1;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Constants.getPercentSize(
                                    containerHeight3, 14),
                                vertical: Constants.getPercentSize(
                                    containerHeight3, 7)),
                            decoration: BoxDecoration(
                                color: lightPrimaryColors,
                                border: Border.all(
                                    width: 1,
                                    color: (selectedPos == 1)
                                        ? accentColors
                                        : Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            width: double.infinity,
                            height: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomText(
                                    S.of(context).no,
                                    textColor,
                                    1,
                                    TextAlign.start,
                                    FontWeight.bold,
                                    Constants.getPercentSize(
                                        containerHeight3, 25)),
                                Visibility(
                                  child: Icon(
                                    Icons.check_circle,
                                    color: accentColors,
                                  ),
                                  visible: (selectedPos == 1) ? true : false,
                                )
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 2.5)),
                getCustomText(
                    S.of(context).whyDoYouWantToAdopt,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.w400,
                    Constants.getPercentSize1(screenHeight, 2.5)),
                Container(
                  margin: EdgeInsets.all(2),
                  height: containerHeight4,
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          Constants.getPercentSize1(containerHeight4, 10),
                      vertical: Constants.getPercentSize1(containerHeight4, 5)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: cardColor,
                      boxShadow: [
                        BoxShadow(
                            color: shadowColor,
                            blurRadius: 2
                        )
                      ]
                      // border: Border.all(
                      //   color: Colors.grey,
                      // ),
                      // borderRadius: BorderRadius.all(Radius.circular(7))
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: Constants.fontsFamily,
                          color: primaryTextColor,
                          fontSize:
                              Constants.getPercentSize(containerHeight4, 15),
                        ),
                        hintText: S.of(context).describeYourReason),
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      fontFamily: Constants.fontsFamily,
                      color: textColor,
                      fontSize: Constants.getPercentSize(containerHeight4, 16),
                    ),
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                getButtonWithColorWithSize(
                    S.of(context).submit,
                    accentColors,
                    Constants.getPercentSize1(screenHeight, 1.5),
                    Constants.getPercentSize1(screenHeight, 2.5), () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdoptionThankYouPage(),
                  ));
                }),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
              ],
            ),
          )),
      onWillPop: () async {
        finish();
        return false;
      },
    );
  }

  void finish() {
    Navigator.of(context).pop();
  }
}
