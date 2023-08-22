import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/ModelAdoption.dart';
import 'package:petcare/screen/AdoptionDetail.dart';

class AdoptionList extends StatefulWidget {
  @override
  _AdoptionList createState() => _AdoptionList();
}

class _AdoptionList extends State<AdoptionList> {
  List<ModelAdoption> subList = DataFile.getAllAdoptionList();
  List<String> selectionList = ["Dog", "Cat", "Rabbit"];
  int selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double cellMargin = 7;
    var _crossAxisSpacing = 8.0;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = SizeConfig.safeBlockHorizontal !* 58;
    var _aspectRatio = _width / cellHeight;
    double mainCatWidth = (SizeConfig.safeBlockHorizontal !* 50) -
        (cellMargin * 2 + _crossAxisSpacing);
    double mainCatHeight = cellHeight;
    double topSliderWidth = SizeConfig.safeBlockHorizontal! * 20;
    double topSliderHeight = SizeConfig.safeBlockHorizontal !* 13;
    double imageSize = SizeConfig.safeBlockVertical !* 6.5;
    double imageSize1 = SizeConfig.safeBlockVertical! * 2.5;
    double marginSearch = SizeConfig.safeBlockHorizontal !* 5;

    return WillPopScope(
      child: Scaffold(
        backgroundColor: ConstantColors.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: getCustomText(S.of(context).adoption, textColor, 1,
              TextAlign.start, FontWeight.w500, 18),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: marginSearch,
                        right: marginSearch,
                        bottom: marginSearch),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: imageSize,
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
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextField(
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: Constants.fontsFamily,
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      Constants.getPercentSize(imageSize, 30)),
                              decoration: InputDecoration(
                                hintText: S.of(context).searchHere,
                                hintStyle: TextStyle(
                                    fontFamily: Constants.fontsFamily,
                                    color: primaryTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: Constants.getPercentSize(
                                        imageSize, 30)),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 3, left: 8),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                              height: imageSize,
                              width: imageSize,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: InkWell(
                                child: Center(
                                    child: Icon(
                                  CupertinoIcons.search,
                                  color: whiteColor,
                                  size: imageSize1,
                                )),
                                onTap: () {},
                              )),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: topSliderHeight,
                    child: ListView.builder(
                      primary: false,
                      padding: EdgeInsets.all(
                          Constants.getPercentSize1(topSliderWidth, 5)),
                      itemCount: selectionList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedPos = index;
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
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(
                          vertical: cellMargin,
                          horizontal: cellMargin + _crossAxisSpacing),
                      crossAxisCount: _crossAxisCount,
                      crossAxisSpacing: _crossAxisSpacing,
                      childAspectRatio: _aspectRatio,
                      children: List.generate(
                        subList.length,
                        (index) {
                          print(
                              "sizes===$mainCatWidth==$mainCatHeight--$_aspectRatio");
                          ModelAdoption _subCatModle = subList[index];

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdoptionDetail(_subCatModle),));
                            },
                            child: Container(
                              width: mainCatWidth,
                              height: mainCatHeight,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                  color: cardColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: shadowColor,
                                        blurRadius: 2
                                    )
                                  ]
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(7)),
                                  // border:
                                  //     Border.all(color: Colors.grey, width: 1)
                              ),
                              margin: EdgeInsets.all(
                                  Constants.getPercentSize(mainCatHeight, 3)),
                              padding: EdgeInsets.all(
                                  Constants.getPercentSize(mainCatHeight, 5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      child: Image.asset(
                                        Constants.assetsImagePath +
                                            _subCatModle.image[0],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  getSpace(Constants.getPercentSize1(
                                      mainCatHeight, 2.5)),
                                  getCustomText(
                                      _subCatModle.name,
                                      textColor,
                                      1,
                                      TextAlign.start,
                                      FontWeight.w500,
                                      Constants.getPercentSize1(
                                          mainCatHeight, 6)),
                                  getCustomText(
                                      _subCatModle.desc,
                                      primaryTextColor,
                                      1,
                                      TextAlign.start,
                                      FontWeight.w400,
                                      Constants.getPercentSize1(
                                          mainCatHeight, 4.3)),
                                  Row(
                                    children: [
                                      getSpace(Constants.getPercentSize1(
                                          mainCatHeight, 1.2)),
                                      getCustomText(
                                          _subCatModle.age,
                                          primaryTextColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.normal,
                                          Constants.getPercentSize1(
                                              mainCatHeight, 3.8)),
                                      getHorizonSpace(Constants.getPercentSize1(
                                          mainCatWidth, 3)),
                                      getCustomText(
                                          _subCatModle.gender,
                                          primaryTextColor,
                                          1,
                                          TextAlign.start,
                                          FontWeight.normal,
                                          Constants.getPercentSize1(
                                              mainCatHeight, 3.8))
                                    ],
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
            ],
          ),
        ),
      ),
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
