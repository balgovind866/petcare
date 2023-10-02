import 'package:flutter/material.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/helper/Constant.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/helper/String.dart';
import 'package:petcare/screen/AddNewPet.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/ModelAdoption.dart';
import 'package:petcare/screen/AdoptionDetail.dart';

class TabPets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabPets();
}

class _TabPets extends State<TabPets> {
  void finish() {
    Navigator.of(context).pop();
  }

  List<String> selectionList = ["Shopping", "Treatment", "Pet Hotel"];
  int selectedPos = 0;
  List<ModelAdoption>? allPetsList = [];

  int expandPosition = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPets();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double screenHeight = SizeConfig.safeBlockVertical! * 100;
    double screenWidth = SizeConfig.safeBlockHorizontal! * 100;
    double addButtonSize = Constants.getPercentSize1(screenWidth, 15);
    double containerHeight = Constants.getPercentSize1(screenWidth, 28);
    double subContainerHeight =
        Constants.getPercentSize1(containerHeight, Constants.subContainer);

    return Scaffold(
      backgroundColor: ConstantColors.bgColor,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios_outlined,
      //       color: textColor,
      //     ),
      //     onPressed: () {
      //       finish();
      //     },
      //   ),
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: Constants.getPercentSize1(screenWidth, 3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCustomText(S.of(context).pets, textColor, 1, TextAlign.start,
                FontWeight.w500, Constants.getPercentSize1(screenHeight, 3.5)),
            getCustomText(
                S.of(context).listBioOfYourFurryFriends,
                primaryTextColor,
                1,
                TextAlign.start,
                FontWeight.w400,
                Constants.getPercentSize1(screenHeight, 2.5)),
            getSpace(Constants.getPercentSize1(screenHeight, 1.3)),
            Expanded(
              child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allPetsList?.length,
                      itemBuilder: (context, index) {
                        ModelAdoption _modelAdoption = allPetsList![index];
                        return InkWell(
                          child: Container(
                            margin: EdgeInsets.all(
                                Constants.getPercentSize1(containerHeight, 5)),
                            width: double.infinity,
                            height: containerHeight,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: cardColor,
                                boxShadow: [
                                  BoxShadow(color: shadowColor, blurRadius: 2)
                                ]
                                // border: Border.all(
                                //   color: Colors.grey,
                                // ),
                                // borderRadius:
                                //     BorderRadius.all(Radius.circular(7))

                                ),
                            padding: EdgeInsets.all(
                                Constants.getPercentSize1(containerHeight, 7)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  child: Container(
                                    width: Constants.getPercentSize1(
                                        containerHeight, 60),
                                    height: Constants.getPercentSize1(
                                        containerHeight, 60),
                                    child: Image.network(
                                      imgBaseUrl + _modelAdoption.profile_img,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                getHorizonSpace(
                                    Constants.getPercentSize1(screenWidth, 3)),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getCustomText(
                                          _modelAdoption.name,
                                          textColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.bold,
                                          Constants.getPercentSize1(
                                              containerHeight, 13)),
                                      getCustomText(
                                          _modelAdoption.description,
                                          primaryTextColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.w400,
                                          Constants.getPercentSize1(
                                              containerHeight, 10)),
                                      getSpace(Constants.getPercentSize1(
                                          containerHeight, 2)),
                                      Container(
                                        height: subContainerHeight,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.all(
                                                  Constants.getPercentSize1(
                                                      subContainerHeight, 4)),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                          subContainerHeight,
                                                          Constants.topTxt)),
                                                  getCustomText(
                                                      _modelAdoption.age,
                                                      textColor,
                                                      1,
                                                      TextAlign.center,
                                                      FontWeight.w500,
                                                      Constants.getPercentSize1(
                                                          subContainerHeight,
                                                          Constants.bottomTxt))
                                                ],
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.all(
                                                  Constants.getPercentSize1(
                                                      subContainerHeight, 4)),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                          subContainerHeight,
                                                          Constants.topTxt)),
                                                  getCustomText(
                                                      _modelAdoption.gender,
                                                      textColor,
                                                      1,
                                                      TextAlign.center,
                                                      FontWeight.w500,
                                                      Constants.getPercentSize1(
                                                          subContainerHeight,
                                                          Constants.bottomTxt))
                                                ],
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.all(
                                                  Constants.getPercentSize1(
                                                      subContainerHeight, 4)),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                  color: lightPrimaryColors),
                                              // color: "#ECEDFA".toColor()),
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
                                                          subContainerHeight,
                                                          Constants.topTxt)),
                                                  getCustomText(
                                                      _modelAdoption.weight ??
                                                          "",
                                                      textColor,
                                                      1,
                                                      TextAlign.center,
                                                      FontWeight.w500,
                                                      Constants.getPercentSize1(
                                                          subContainerHeight,
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
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  AdoptionDetail(_modelAdoption),
                            ));
                          },
                        );
                      })),
              flex: 1,
            ),
            Container(
              width: double.infinity,
              height: addButtonSize,
              margin: EdgeInsets.only(
                  top: Constants.getPercentSize1(screenHeight, 1.2),
                  bottom: Constants.getPercentSize1(screenHeight, 2.5)),
              decoration: BoxDecoration(
                  color: accentColors,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: Constants.getPercentSize1(addButtonSize, 30),
                    ),
                    getHorizonSpace(5),
                    getCustomText(
                        S.of(context).addNewPet,
                        Colors.white,
                        1,
                        TextAlign.center,
                        FontWeight.w500,
                        Constants.getPercentSize1(addButtonSize, 25))
                  ],
                ),
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddNewPet(),
                  ));
                  getPets();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getPets() async {
    Map parameter = {};
    print("HELLO");
    apiBaseHelper.postAPICall(getPetsApi, parameter).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var data = getdata['data']['data'];
          print("data $data");
          allPetsList = ((data as List)
              .map((json) => ModelAdoption.fromJson(json))
              .toList());
          setSnackbar(msg!, context);
        } else {
          setSnackbar(msg!, context);
        }
        setState(() {});
      },
      onError: (error) {
        setSnackbar(error.toString(), context);
      },
    );
  }
}
