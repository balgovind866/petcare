import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/data/PrefData.dart';
import 'package:petcare/screen/SubmitAdoptionForm.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/customwidget/StarRating.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';

import 'dart:math' as math;

import 'package:petcare/model/ReviewModel.dart';
import 'package:petcare/model/ModelAdoption.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'; // import this

// ignore: must_be_immutable
class AdoptionDetail extends StatefulWidget {
  ModelAdoption _categoryModel;

  AdoptionDetail(this._categoryModel);

  @override
  _AdoptionDetail createState() => _AdoptionDetail(_categoryModel);
}

class _AdoptionDetail extends State<AdoptionDetail>
    with SingleTickerProviderStateMixin {
  double paddingStart = 10;
  ModelAdoption? _modelProduct;
  double addon = 0;

  _AdoptionDetail(this._modelProduct);

  double heightAdRemove = 50;
  int quantity = 1;
  TabController? _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    PrefData().setSelectedMainCategory(Constants.ADOPTION_ID);

    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    try {
      _tabController!.dispose();
    } catch (e) {
      print(e);
    }
    super.dispose();
  }

  int selectedAddons = 0;
  PageController controller = PageController();
  double currentPage = 0;

  dot(bool selected) {
    double size = 6;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 2, left: 2, bottom: 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (selected) ? accentColors : Colors.white),
      ),
    );
  }

  _drawDots(page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < _modelProduct!.image.length; i++) dot((page == i)),
      ],
    );
  }

  List<ReviewModel> _reviewModel = DataFile.getReviewList();
  int selectedSliderPos = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sliderHeight = SizeConfig.safeBlockVertical! * 40;
    double bottomRemainHeight =
        SizeConfig.safeBlockVertical! * 100 - sliderHeight;
    heightAdRemove = Constants.getPercentSize(bottomRemainHeight, 10);
    print("bottom==$bottomRemainHeight");
    double containerHeight = SizeConfig.safeBlockHorizontal! * 15;

    return WillPopScope(
        child: Scaffold(
            backgroundColor: ConstantColors.bgColor,
            bottomNavigationBar: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: SizeConfig.safeBlockVertical! * 9,
              child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 13,
                        blurRadius: 13,
                        offset: Offset(0, 10), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal! * 1.5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: accentColors,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                SubmitAdoptionForm(_modelProduct!),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.shopping_cart,
                            //   color: Colors.white,
                            //   size: Constants.getPercentSize(
                            //       SizeConfig.safeBlockVertical * 9, 38),
                            // ),
                            // getHorizonSpace(
                            //     SizeConfig.safeBlockHorizontal * 5),
                            getCustomText(
                                S.of(context).adoptNow,
                                Colors.white,
                                1,
                                TextAlign.center,
                                FontWeight.w600,
                                Constants.getPercentSize(
                                    SizeConfig.safeBlockVertical! * 9, 22))
                          ],
                        ),
                      ))),
            ),
            body: Stack(
              children: [
                NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        // backgroundColor: accentColors,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        // backgroundColor: Colors.transparent,
                        leading: InkWell(
                          onTap: () {
                            finish();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        // backgroundColor: ConstantColors.bgColors  ,
                        actions: <Widget>[
                          IconButton(
                              icon: Icon(
                                // (_modelProduct.isFav)
                                //     ?
                                // Icons.favorite_rounded
                                //       :
                                Icons.favorite_border_rounded,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  // if (_modelProduct.isFav) {
                                  //   _modelProduct.isFav = false;
                                  // } else {
                                  //   _modelProduct.isFav = true;
                                  // }
                                });
                              })
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child:InkWell(
                          //       onTap: () {
                          //         setState(() {
                          //           // if (_modelProduct.isFav) {
                          //           //   _modelProduct.isFav = false;
                          //           // } else {
                          //           //   _modelProduct.isFav = true;
                          //           // }
                          //         });
                          //       },
                          //       child: Icon(
                          //         // (_modelProduct.isFav)
                          //         //     ?
                          //       // Icons.favorite_rounded
                          //       //       :
                          //       Icons.favorite_border_rounded,
                          //         color: Colors.red,
                          //       ),
                          //     ),
                          //   ),
                        ],
                        expandedHeight: sliderHeight,
                        flexibleSpace: FlexibleSpaceBar(
                            centerTitle: false,
                            background: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(children: [
                                  PageView.builder(
                                    controller: controller,
                                    itemCount: _modelProduct!.image.length,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (value) {
                                      selectedSliderPos = value;
                                    },
                                    itemBuilder: (context, index) {
                                      return Image.asset(
                                        Constants.assetsImagePath +
                                            _modelProduct!.image[index],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      );
                                    },
                                  ),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: EdgeInsets.all(0),
                                        // padding: EdgeInsets.all(7),
                                        child: _drawDots(currentPage),
                                      ))
                                ]))
                            // DottedSlider(
                            //     color: Colors.transparent,
                            //     maxHeight: sliderHeight,
                            //     children: List.generate(3, (index) {
                            //       return Image.asset(
                            //         Constants.assetsImagePath +
                            //             _modelProduct.image,
                            //         fit: BoxFit.cover,
                            //         width: double.infinity,
                            //         height: double.infinity,
                            //       );
                            //
                            //       // return Container(
                            //       //   height: double.infinity,
                            //       //   width: double.infinity,
                            //       //   decoration: BoxDecoration(
                            //       //     image: DecorationImage(
                            //       //         image: AssetImage(
                            //       //             Constants.assetsImagePath +
                            //       //                 _modelProduct.image),
                            //       //         fit: BoxFit.cover),
                            //       //   ),
                            //       // );
                            //       // // return _productSlideImage(
                            //       // //     _modelProduct.image);
                            //     }))
                            ),
                      ),
                    ];
                  },
                  body: Stack(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(math.pi * -1),
                        child: Image.asset(
                          Constants.assetsImagePath +
                              _modelProduct!.image[selectedIndex],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: sliderHeight,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ConstantColors.bgColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35))),
                        child: SingleChildScrollView(
                          padding:
                              EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              getCustomText(
                                  _modelProduct!.name,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w500,
                                  Constants.getPercentSize(
                                      bottomRemainHeight, 6)),
                              getCustomText(
                                  _modelProduct!.desc,
                                  primaryTextColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w400,
                                  Constants.getPercentSize(
                                      bottomRemainHeight, 4)),
                              getSpace(Constants.getPercentSize1(
                                  bottomRemainHeight, 2)),
                              getCustomText(
                                  S.of(context).lorem_text,
                                  Colors.grey,
                                  2,
                                  TextAlign.start,
                                  FontWeight.normal,
                                  Constants.getPercentSize1(
                                      bottomRemainHeight, 3.2)),
                              getSpace(Constants.getPercentSize1(
                                  bottomRemainHeight, 3.5)),
                              Container(
                                height: containerHeight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.all(
                                          Constants.getPercentSize1(
                                              containerHeight, 4)),
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
                                                  containerHeight, 17)),
                                          getCustomText(
                                              _modelProduct!.age,
                                              textColor,
                                              1,
                                              TextAlign.center,
                                              FontWeight.w500,
                                              Constants.getPercentSize1(
                                                  containerHeight, 20))
                                        ],
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.all(
                                          Constants.getPercentSize1(
                                              containerHeight, 4)),
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
                                                  containerHeight, 17)),
                                          getCustomText(
                                              _modelProduct!.gender,
                                              textColor,
                                              1,
                                              TextAlign.center,
                                              FontWeight.w500,
                                              Constants.getPercentSize1(
                                                  containerHeight, 20))
                                        ],
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.all(
                                          Constants.getPercentSize1(
                                              containerHeight, 4)),
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
                                              FontWeight.w400,
                                              Constants.getPercentSize1(
                                                  containerHeight, 17)),
                                          getCustomText(
                                              _modelProduct!.weight,
                                              textColor,
                                              1,
                                              TextAlign.center,
                                              FontWeight.w400,
                                              Constants.getPercentSize1(
                                                  containerHeight, 20))
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              getSpace(Constants.getPercentSize1(
                                  bottomRemainHeight, 3.5)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: "#FFA902".toColor(),
                                  ),
                                  getCustomText(
                                      "4.6(89 reviews)",
                                      textColor,
                                      1,
                                      TextAlign.start,
                                      FontWeight.w600,
                                      Constants.getPercentSize1(
                                          bottomRemainHeight, 3.8)),
                                ],
                              ),
                              getSpace(Constants.getPercentSize(
                                  bottomRemainHeight, 3)),
                              SizedBox(
                                height: 7,
                              ),
                              TabBar(
                                controller: _tabController,
                                labelColor: accentColors,
                                indicatorColor: accentColors,
                                labelPadding: EdgeInsets.all(10),
                                unselectedLabelColor: Colors.grey,
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    fontFamily: Constants.fontsFamily),
                                unselectedLabelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    fontFamily: Constants.fontsFamily),
                                onTap: (int index) {
                                  setState(() {
                                    selectedIndex = index;
                                    _tabController!.animateTo(index);
                                  });
                                },
                                tabs: <Widget>[
                                  // Text("Product Description"),
                                  getCustomText(
                                      S.of(context).description,
                                      accentColors,
                                      1,
                                      TextAlign.center,
                                      FontWeight.w500,
                                      Constants.getPercentSize(
                                          bottomRemainHeight, 4)),
                                  getCustomText(
                                      S.of(context).review,
                                      accentColors,
                                      1,
                                      TextAlign.center,
                                      FontWeight.w500,
                                      Constants.getPercentSize(
                                          bottomRemainHeight, 4)),
                                ],
                              ),
                              IndexedStack(
                                children: <Widget>[
                                  Visibility(
                                    child: Container(
                                        padding: EdgeInsets.all(7),
                                        child: getCustomTextWithoutMax(
                                            S.of(context).lorem_text,
                                            textColor,
                                            TextAlign.start,
                                            FontWeight.w400,
                                            20)),
                                    maintainState: true,
                                    visible: selectedIndex == 0,
                                  ),
                                  Visibility(
                                    child: Padding(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.all(paddingStart),
                                            width: double.infinity,
                                            padding: EdgeInsets.only(
                                                top: Constants.getPercentSize(
                                                    bottomRemainHeight, 6),
                                                bottom:
                                                    Constants.getPercentSize(
                                                        bottomRemainHeight, 6)),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7)),
                                                color: cardColor),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                getCustomText(
                                                    "4.8",
                                                    textColor,
                                                    1,
                                                    TextAlign.center,
                                                    FontWeight.bold,
                                                    Constants.getPercentSize(
                                                        bottomRemainHeight, 7)),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                  child: StarRating(
                                                    rating: 4.8,
                                                    setColor: primaryColor,
                                                    size: Constants
                                                        .getPercentSize(
                                                            bottomRemainHeight,
                                                            7),
                                                    isCenter: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ListView.builder(
                                            primary: false,
                                            itemBuilder: (context, index) {
                                              double imageSize = SizeConfig
                                                      .safeBlockVertical! *
                                                  7;
                                              double leftMargin = SizeConfig
                                                      .safeBlockVertical! *
                                                  1.2;
                                              ReviewModel reViewModel =
                                                  _reviewModel[index];
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    top: (index == 0) ? 0 : 5,
                                                    bottom: 5,
                                                    left: SizeConfig
                                                            .safeBlockHorizontal! *
                                                        2,
                                                    right: SizeConfig
                                                            .safeBlockHorizontal! *
                                                        2),
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: ConstantColors.bgColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //     color: Colors
                                                  //         .grey.shade200,
                                                  //     blurRadius: 10,
                                                  //   )
                                                  // ]
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: imageSize,
                                                          width: imageSize,
                                                          // margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors
                                                                .transparent,
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    'https://i.stack.imgur.com/0VpX0.png'),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left:
                                                                      leftMargin),
                                                          child: getCustomText(
                                                              reViewModel
                                                                      .name ??
                                                                  "",
                                                              textColor,
                                                              1,
                                                              TextAlign.start,
                                                              FontWeight.bold,
                                                              15),
                                                          // child: Text(reViewModel.name,
                                                          //     textAlign: TextAlign.start,
                                                          //     style: TextStyle(
                                                          //         fontFamily: ConstantData.fontFamily,
                                                          //         fontWeight: FontWeight.bold,
                                                          //         fontSize: ConstantData.font15Px,
                                                          //         color: ConstantData.textColor,
                                                          //         decoration: TextDecoration.none)),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: (imageSize +
                                                              leftMargin)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          RatingBar.builder(
                                                            itemSize: 15,
                                                            initialRating:
                                                                reViewModel
                                                                    .review!,
                                                            minRating: 1,
                                                            direction:
                                                                Axis.horizontal,
                                                            allowHalfRating:
                                                                true,
                                                            itemCount: 5,
                                                            tapOnlyMode: true,
                                                            updateOnDrag: true,
                                                            itemPadding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        0.0),
                                                            itemBuilder:
                                                                (context, _) =>
                                                                    Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                              size: 10,
                                                            ),
                                                            onRatingUpdate:
                                                                (rating) {
                                                              print(rating);
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5),
                                                            child: getCustomText(
                                                                reViewModel
                                                                    .desc!,
                                                                primaryTextColor,
                                                                2,
                                                                TextAlign.start,
                                                                FontWeight.w400,
                                                                10),
                                                            // child: Text(reViewModel.desc,
                                                            //     textAlign: TextAlign.start,
                                                            //     style: TextStyle(
                                                            //         fontFamily: ConstantData.fontFamily,
                                                            //         fontWeight: FontWeight.w400,
                                                            //         fontSize: 10,
                                                            //         color: ConstantData.primaryTextColor,
                                                            //         decoration: TextDecoration.none)),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                              // return Container(
                                              //   margin: EdgeInsets.symmetric(
                                              //       vertical: Constants
                                              //           .getPercentSize(
                                              //               bottomRemainHeight,
                                              //               2)),
                                              //   width: double.infinity,
                                              //   child: Row(
                                              //     mainAxisSize:
                                              //         MainAxisSize.max,
                                              //     children: [
                                              //       Container(
                                              //         margin: EdgeInsets.only(
                                              //             left: 5,
                                              //             top: 5,
                                              //             bottom: 5,
                                              //             right: paddingStart),
                                              //         width: SizeConfig
                                              //                 .safeBlockHorizontal *
                                              //             10,
                                              //         height: SizeConfig
                                              //                 .safeBlockHorizontal *
                                              //             10,
                                              //         decoration: BoxDecoration(
                                              //           shape: BoxShape.circle,
                                              //           image: DecorationImage(
                                              //               image: NetworkImage(
                                              //                   'https://i.stack.imgur.com/0VpX0.png'),
                                              //               fit: BoxFit.cover),
                                              //         ),
                                              //       ),
                                              //       SizedBox(
                                              //         width: Constants
                                              //             .getPercentSize(
                                              //                 bottomRemainHeight,
                                              //                 2),
                                              //       ),
                                              //       Expanded(
                                              //         child: getCustomText(
                                              //             S
                                              //                 .of(context)
                                              //                 .loremText,
                                              //             Colors.grey,
                                              //             3,
                                              //             TextAlign.start,
                                              //             FontWeight.w500,
                                              //             Constants.getPercentSize(
                                              //                 bottomRemainHeight,
                                              //                 4)),
                                              //         flex: 1,
                                              //       )
                                              //     ],
                                              //   ),
                                              // );
                                            },
                                            itemCount: _reviewModel.length,
                                            shrinkWrap: true,
                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.all(7),
                                    ),
                                    maintainState: true,
                                    visible: selectedIndex == 1,
                                  ),
                                ],
                                index: selectedIndex,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
        onWillPop: () async {
          finish();
          return false;
        });
  }

  void finish() {
    Navigator.of(context).pop();
  }

// void setPrice() {
//   price = (orgPrice * quantity) + addon;
// }
}
