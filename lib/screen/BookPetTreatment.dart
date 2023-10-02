import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/ModelAdoption.dart';
import 'package:petcare/model/ModelTreatment.dart';
import 'package:petcare/screen/CheckOutPage.dart';

class BookPetTreatment extends StatefulWidget {
  BookPetTreatment();

  @override
  _BookPetTreatment createState() => _BookPetTreatment();
}

class _BookPetTreatment extends State<BookPetTreatment> {
  int selectedPos = 0;
  int selectedTimePos = 0;
  int selectedPetPos = 0;
  int selectedPetTreatmentPos = 0;
  List<ModelTreatment> treatmentList = DataFile.getAllTreatmentList();

  DatePickerController _controller = DatePickerController();

  List<String> filterList = [
    "10 AM - 11 AM",
    "10 AM - 11 AM",
    "12 AM - 1 PM",
    "1 PM - 2 PM",
    "2 PM - 3 PM",
    "3 PM - 4 PM",
    "4 PM - 5 PM",
    "5 PM - 6 PM",
    "6 PM - 7 PM",
  ];

  List<ModelAdoption> _adoptionList = DataFile.getAllAdoptionList();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenHeight = SizeConfig.safeBlockVertical! * 100;
    double screenWidth = SizeConfig.safeBlockHorizontal! * 100;
    double containerHeight = Constants.getPercentSize1(screenWidth, 28);
    double containerHeight2 = Constants.getPercentSize1(screenWidth, 25);
    double imageSize2 = Constants.getPercentSize1(containerHeight, 65);
    double imageSize = Constants.getPercentSize1(containerHeight, 70);
    double containerHeight3 = Constants.getPercentSize1(screenWidth, 12);
    var bottomDialogTextSize = SizeConfig.safeBlockVertical! * 55;
    double dialogContainerHeight = Constants.getPercentSize1(screenWidth, 28);
    double dialogSubContainerHeight =
        Constants.getPercentSize1(containerHeight, Constants.subContainer);
    print("subcontainer111==$dialogSubContainerHeight");

    var _crossAxisSpacing2 = 8.0;
    var _crossAxisCount2 = 3;
    var _width2 =
        (screenWidth - ((_crossAxisCount2 - 1) * _crossAxisSpacing2)) /
            _crossAxisCount2;
    var cellHeight2 = Constants.getPercentSize1(screenWidth, 10);
    var _aspectRatio2 = _width2 / cellHeight2;

    return WillPopScope(
      child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
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
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Constants.getPercentSize1(screenWidth, 3)),
            child: ListView(
              children: [
                getCustomText(
                    S.of(context).petTreatment,
                    textColor,
                    1,
                    TextAlign.start,
                    FontWeight.w500,
                    Constants.getPercentSize1(screenHeight, 3.5)),
                getCustomText(
                    S.of(context).theKindOfCareYourPetDeserve,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.w400,
                    Constants.getPercentSize1(screenHeight, 2.5)),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                getCustomText(
                    S.of(context).selectPet,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.bold,
                    Constants.getPercentSize1(screenHeight, 2)),
                Container(
                  width: double.infinity,
                  height: containerHeight,
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: cardColor,
                      // color: Colors.grey,
                      // border:
                      //     Border.all(color: Colors.grey, width: 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(color: shadowColor, blurRadius: 1.2)
                        // BoxShadow(color: "#B9B9B9".toColor(), blurRadius:1.2)
                      ]

                      // border: Border.all(
                      //   color: Colors.grey,
                      // ),
                      // borderRadius: BorderRadius.all(Radius.circular(7))
                      ),
                  padding: EdgeInsets.all(
                      Constants.getPercentSize1(containerHeight, 7)),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                  Constants.getPercentSize1(
                                      bottomDialogTextSize, 10)),
                              topLeft: Radius.circular(
                                  Constants.getPercentSize1(
                                      bottomDialogTextSize, 10))),
                        ),
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                height: bottomDialogTextSize,
                                padding: EdgeInsets.only(
                                    top: Constants.getPercentSize1(
                                        bottomDialogTextSize, 6),
                                    left: Constants.getPercentSize1(
                                        bottomDialogTextSize, 6),
                                    right: Constants.getPercentSize1(
                                        bottomDialogTextSize, 6),
                                    bottom: Constants.getPercentSize1(
                                        bottomDialogTextSize, 4)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          Constants.getPercentSize1(
                                              bottomDialogTextSize, 10)),
                                      topLeft: Radius.circular(
                                          Constants.getPercentSize1(
                                              bottomDialogTextSize, 10))),
                                  color: ConstantColors.bgColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getDialogDivider(
                                        SizeConfig.safeBlockHorizontal! * 20),
                                    getCustomText(
                                        S.of(context).pets,
                                        textColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w500,
                                        Constants.getPercentSize(
                                            bottomDialogTextSize, 5)),
                                    getCustomText(
                                        S
                                            .of(context)
                                            .selectPetThatWillGetTreatment,
                                        primaryTextColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w300,
                                        Constants.getPercentSize(
                                            bottomDialogTextSize, 4)),
                                    Expanded(
                                      child: Container(
                                        child: ListView.builder(
                                          itemCount: _adoptionList.length,
                                          shrinkWrap: true,
                                          primary: true,
                                          itemBuilder: (context, index) {
                                            ModelAdoption _modelAdoption =
                                                _adoptionList[index];
                                            return InkWell(
                                              onTap: () {
                                                print("selectedpos=$index");
                                                setState(() {
                                                  selectedPetPos = index;
                                                  print(
                                                      "selectedpos1=$selectedPetPos");
                                                });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.all(
                                                    Constants.getPercentSize1(
                                                        dialogContainerHeight,
                                                        5)),
                                                height: dialogContainerHeight,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: (selectedPetPos ==
                                                              index)
                                                          ? accentColors
                                                          : Colors.grey,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                7))),
                                                padding: EdgeInsets.all(
                                                    Constants.getPercentSize1(
                                                        dialogContainerHeight,
                                                        7)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7)),
                                                      child: Container(
                                                        width: Constants
                                                            .getPercentSize1(
                                                                dialogContainerHeight,
                                                                60),
                                                        height: Constants
                                                            .getPercentSize1(
                                                                dialogContainerHeight,
                                                                60),
                                                        child: Image.asset(
                                                          Constants
                                                                  .assetsImagePath +
                                                              _modelAdoption
                                                                  .profile_img,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    getHorizonSpace(Constants
                                                        .getPercentSize1(
                                                            screenWidth, 3)),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          getCustomText(
                                                              _modelAdoption
                                                                  .name,
                                                              textColor,
                                                              1,
                                                              TextAlign.start,
                                                              FontWeight.bold,
                                                              Constants
                                                                  .getPercentSize1(
                                                                      dialogContainerHeight,
                                                                      14)),
                                                          getCustomText(
                                                              _modelAdoption
                                                                  .description,
                                                              primaryTextColor,
                                                              1,
                                                              TextAlign.start,
                                                              FontWeight.w400,
                                                              Constants
                                                                  .getPercentSize1(
                                                                      dialogContainerHeight,
                                                                      11)),
                                                          getSpace(Constants
                                                              .getPercentSize1(
                                                                  dialogContainerHeight,
                                                                  2)),
                                                          Container(
                                                            height:
                                                                dialogSubContainerHeight,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                    child:
                                                                        Container(
                                                                  margin: EdgeInsets.all(
                                                                      Constants.getPercentSize1(
                                                                          dialogSubContainerHeight,
                                                                          4)),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              7)),
                                                                      color:
                                                                          lightPrimaryColors),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      getCustomText(
                                                                          S
                                                                              .of(
                                                                                  context)
                                                                              .AGE,
                                                                          primaryTextColor,
                                                                          1,
                                                                          TextAlign
                                                                              .center,
                                                                          FontWeight
                                                                              .w500,
                                                                          Constants.getPercentSize1(
                                                                              dialogSubContainerHeight,
                                                                              Constants.topTxt)),
                                                                      getCustomText(
                                                                          _modelAdoption
                                                                              .age,
                                                                          textColor,
                                                                          1,
                                                                          TextAlign
                                                                              .center,
                                                                          FontWeight
                                                                              .w500,
                                                                          Constants.getPercentSize1(
                                                                              dialogSubContainerHeight,
                                                                              Constants.bottomTxt))
                                                                    ],
                                                                  ),
                                                                )),
                                                                Expanded(
                                                                    child:
                                                                        Container(
                                                                  margin: EdgeInsets.all(
                                                                      Constants.getPercentSize1(
                                                                          dialogSubContainerHeight,
                                                                          4)),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              7)),
                                                                      color:
                                                                          lightPrimaryColors),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      getCustomText(
                                                                          S
                                                                              .of(
                                                                                  context)
                                                                              .SEX,
                                                                          primaryTextColor,
                                                                          1,
                                                                          TextAlign
                                                                              .center,
                                                                          FontWeight
                                                                              .w500,
                                                                          Constants.getPercentSize1(
                                                                              dialogSubContainerHeight,
                                                                              Constants.topTxt)),
                                                                      getCustomText(
                                                                          _modelAdoption
                                                                              .gender,
                                                                          textColor,
                                                                          1,
                                                                          TextAlign
                                                                              .center,
                                                                          FontWeight
                                                                              .w500,
                                                                          Constants.getPercentSize1(
                                                                              dialogSubContainerHeight,
                                                                              Constants.bottomTxt))
                                                                    ],
                                                                  ),
                                                                )),
                                                                Expanded(
                                                                    child:
                                                                        Container(
                                                                  margin: EdgeInsets.all(
                                                                      Constants.getPercentSize1(
                                                                          dialogSubContainerHeight,
                                                                          4)),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              7)),
                                                                      color:
                                                                          lightPrimaryColors),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      getCustomText(
                                                                          S
                                                                              .of(
                                                                                  context)
                                                                              .WEIGHT,
                                                                          primaryTextColor,
                                                                          1,
                                                                          TextAlign
                                                                              .center,
                                                                          FontWeight
                                                                              .w500,
                                                                          Constants.getPercentSize1(
                                                                              dialogSubContainerHeight,
                                                                              Constants.topTxt)),
                                                                      getCustomText(
                                                                          _modelAdoption.weight ??
                                                                              "",
                                                                          textColor,
                                                                          1,
                                                                          TextAlign
                                                                              .center,
                                                                          FontWeight
                                                                              .w500,
                                                                          Constants.getPercentSize1(
                                                                              dialogSubContainerHeight,
                                                                              Constants.bottomTxt))
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
                                            );
                                          },
                                        ),
                                      ),
                                      flex: 1,
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ).then((value) {
                        setState(() {});
                      });
                    },
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
                                  _adoptionList[selectedPetPos].profile_img,
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
                                        _adoptionList[selectedPetPos].name,
                                        textColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.bold,
                                        Constants.getPercentSize1(
                                            containerHeight, 14)),
                                    getCustomText(
                                        _adoptionList[selectedPetPos]
                                            .description,
                                        primaryTextColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w400,
                                        Constants.getPercentSize1(
                                            containerHeight, 11)),
                                  ],
                                ),
                                flex: 1,
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: primaryTextColor,
                                  ),
                                  onPressed: () {})
                            ],
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                getCustomText(
                    S.of(context).selectTreatment,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.bold,
                    Constants.getPercentSize1(screenHeight, 2)),
                Container(
                  width: double.infinity,
                  height: containerHeight,
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: cardColor,
                      // color: Colors.grey,
                      // border:
                      //     Border.all(color: Colors.grey, width: 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(color: shadowColor, blurRadius: 1.2)
                        // BoxShadow(color: "#B9B9B9".toColor(), blurRadius:1.2)
                      ]
                      // border: Border.all(
                      //   color: Colors.grey,
                      // ),
                      // borderRadius: BorderRadius.all(Radius.circular(7))
                      ),
                  padding: EdgeInsets.all(
                      Constants.getPercentSize1(containerHeight, 7)),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                  Constants.getPercentSize1(
                                      bottomDialogTextSize, 10)),
                              topLeft: Radius.circular(
                                  Constants.getPercentSize1(
                                      bottomDialogTextSize, 10))),
                        ),
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                height: bottomDialogTextSize,
                                padding: EdgeInsets.only(
                                    top: Constants.getPercentSize1(
                                        bottomDialogTextSize, 6),
                                    left: Constants.getPercentSize1(
                                        bottomDialogTextSize, 6),
                                    right: Constants.getPercentSize1(
                                        bottomDialogTextSize, 6),
                                    bottom: Constants.getPercentSize1(
                                        bottomDialogTextSize, 4)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          Constants.getPercentSize1(
                                              bottomDialogTextSize, 10)),
                                      topLeft: Radius.circular(
                                          Constants.getPercentSize1(
                                              bottomDialogTextSize, 10))),
                                  color: ConstantColors.bgColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getDialogDivider(
                                        SizeConfig.safeBlockHorizontal! * 20),
                                    getCustomText(
                                        S.of(context).grooming,
                                        textColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w500,
                                        Constants.getPercentSize(
                                            bottomDialogTextSize, 5)),
                                    getCustomText(
                                        S.of(context).selectTreatmentForYourPet,
                                        primaryTextColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w300,
                                        Constants.getPercentSize(
                                            bottomDialogTextSize, 4)),
                                    Expanded(
                                      child: Container(
                                        child: ListView.builder(
                                          itemCount: treatmentList.length,
                                          shrinkWrap: true,
                                          primary: true,
                                          itemBuilder: (context, index) {
                                            ModelTreatment _modelAdoption =
                                                treatmentList[index];
                                            return Container(
                                              width: double.infinity,
                                              height: containerHeight2,
                                              margin: EdgeInsets.all(
                                                  Constants.getPercentSize1(
                                                      containerHeight2, 5)),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1,
                                                    color:
                                                        (selectedPetTreatmentPos ==
                                                                index)
                                                            ? accentColors
                                                            : Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7))),
                                              padding: EdgeInsets.all(
                                                  Constants.getPercentSize1(
                                                      containerHeight2, 7)),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedPetTreatmentPos =
                                                        index;
                                                    print(
                                                        "selectedpos1=$selectedPetTreatmentPos");
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7)),
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            Constants
                                                                .getPercentSize1(
                                                                    imageSize2,
                                                                    20)),
                                                        width: imageSize2,
                                                        height: imageSize2,
                                                        color:
                                                            lightPrimaryColors,
                                                        child: Image.asset(
                                                          Constants
                                                                  .assetsImagePath +
                                                              _modelAdoption
                                                                  .image,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    getHorizonSpace(Constants
                                                        .getPercentSize1(
                                                            screenWidth, 3)),
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                getCustomText(
                                                                    _modelAdoption
                                                                        .title,
                                                                    textColor,
                                                                    1,
                                                                    TextAlign
                                                                        .start,
                                                                    FontWeight
                                                                        .bold,
                                                                    Constants.getPercentSize1(
                                                                        containerHeight2,
                                                                        14)),
                                                                getCustomText(
                                                                    _modelAdoption
                                                                        .description,
                                                                    primaryTextColor,
                                                                    2,
                                                                    TextAlign
                                                                        .start,
                                                                    FontWeight
                                                                        .w400,
                                                                    Constants.getPercentSize1(
                                                                        containerHeight2,
                                                                        11)),
                                                                getCustomText(
                                                                    _modelAdoption.currencyCode +
                                                                        _modelAdoption
                                                                            .currency
                                                                            .toString(),
                                                                    colorOrange,
                                                                    1,
                                                                    TextAlign
                                                                        .start,
                                                                    FontWeight
                                                                        .bold,
                                                                    Constants
                                                                        .getPercentSize1(
                                                                            containerHeight2,
                                                                            13))
                                                              ],
                                                            ),
                                                            flex: 1,
                                                          ),
                                                          Visibility(
                                                            child: IconButton(
                                                                icon: Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color:
                                                                      accentColors,
                                                                ),
                                                                onPressed:
                                                                    () {}),
                                                            visible:
                                                                (selectedPetTreatmentPos ==
                                                                        index)
                                                                    ? true
                                                                    : false,
                                                          )
                                                        ],
                                                      ),
                                                      flex: 1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      flex: 1,
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ).then((value) {
                        setState(() {});
                      });
                    },
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
                              Constants.assetsImagePath +
                                  treatmentList[selectedPetTreatmentPos].image,
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
                                        treatmentList[selectedPetTreatmentPos]
                                            .title,
                                        textColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.bold,
                                        Constants.getPercentSize1(
                                            containerHeight, 14)),
                                    getCustomText(
                                        treatmentList[selectedPetTreatmentPos]
                                            .description,
                                        primaryTextColor,
                                        2,
                                        TextAlign.start,
                                        FontWeight.w400,
                                        Constants.getPercentSize1(
                                            containerHeight, 11)),
                                    getCustomText(
                                        treatmentList[selectedPetTreatmentPos]
                                                .currencyCode +
                                            treatmentList[
                                                    selectedPetTreatmentPos]
                                                .currency
                                                .toString(),
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
                              IconButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: primaryTextColor,
                                  ),
                                  onPressed: () {})
                            ],
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                getCustomText(
                    S.of(context).serviceTypes,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.bold,
                    Constants.getPercentSize1(screenHeight, 2)),
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
                                    S.of(context).pickUp,
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
                                    S.of(context).storeVisit,
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
                      ),
                    ],
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                Container(
                  child: DatePicker(
                    DateTime.now(),
                    width: 60,
                    height: 85,
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: accentColors,
                    selectedTextColor: Colors.white,
                    monthTextStyle: TextStyle(
                        fontFamily: Constants.fontsFamily, color: textColor),
                    dateTextStyle: TextStyle(
                        fontFamily: Constants.fontsFamily, color: textColor),
                    dayTextStyle: TextStyle(
                        fontFamily: Constants.fontsFamily, color: textColor),
                    // inactiveDates: [
                    //   DateTime.now().add(Duration(days: 3)),
                    //   DateTime.now().add(Duration(days: 4)),
                    //   DateTime.now().add(Duration(days: 7))
                    // ],
                    onDateChange: (date) {
                      // New date selected
                      setState(() {});
                    },
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 2)),
                getCustomText(
                    S.of(context).selectTime,
                    primaryTextColor,
                    1,
                    TextAlign.start,
                    FontWeight.bold,
                    Constants.getPercentSize1(screenHeight, 2)),
                getSpace(Constants.getPercentSize1(screenHeight, 1.2)),
                GridView.count(
                  shrinkWrap: true,
                  primary: true,
                  mainAxisSpacing: _crossAxisSpacing2,
                  // padding: EdgeInsets.symmetric(
                  //     vertical: cellMargin2,
                  //     horizontal: cellMargin2 +
                  //         _crossAxisSpacing2),
                  crossAxisCount: _crossAxisCount2,
                  crossAxisSpacing: _crossAxisSpacing2,
                  childAspectRatio: _aspectRatio2,
                  children: List.generate(
                    filterList.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedTimePos = index;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: cellHeight2,
                          decoration: BoxDecoration(
                              color: lightPrimaryColors,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              border: Border.all(
                                  color: (selectedTimePos == index)
                                      ? accentColors
                                      : Colors.transparent,
                                  width: 1)),
                          child: Center(
                            child: getCustomText(
                                filterList[index],
                                textColor,
                                1,
                                TextAlign.center,
                                FontWeight.w500,
                                Constants.getPercentSize1(cellHeight2, 25)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                getSpace(Constants.getPercentSize1(screenHeight, 3)),
                getButtonWithColorWithSize(
                    S.of(context).bookNow,
                    accentColors,
                    Constants.getPercentSize1(screenHeight, 1.5),
                    Constants.getPercentSize1(screenHeight, 2.5), () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckOutPage()));
                }),
                getSpace(Constants.getPercentSize1(screenHeight, 2.5)),
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
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(0),
        ));
    ;
  }
}
