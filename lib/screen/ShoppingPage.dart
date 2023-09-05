import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/Model/Section_Model.dart';
import 'package:petcare/Provider/CategoryProvider.dart';
import 'package:petcare/Provider/ProductProvider.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/model/SubCategoryModel.dart';
import 'package:petcare/screen/ProductDetail.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../constants/SizeConfig.dart';
import '../helper/String.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPage createState() => _ShoppingPage();
}

class _ShoppingPage extends State<ShoppingPage> {
  List<List<SubCategoryModel>> allCatList = [
    DataFile.getAllCategoryModel(),
    DataFile.getFoodCategoryModel(),
    DataFile.getBeltModel(),
    DataFile.getSubCategoryModel()
  ];

  // List<SubCategoryModel> subList = DataFile.getSubCategoryModel();
  List<String> selectionList = ["All", "Food", "Belt", "Cloths"];
  List<String> selectedFilterList = [];
  List<Product>? catList = [];
  List<Product>? popularList = [];

  List<String> filterList = [
    // "King",
    // "Pedigre",
    // "Barker",
    // "Whiskes",
    // "Chomp",
    // "Pet Toys",
    // "Meowo",
    // "Basche",
    // "Domino"
  ];
  List<String> selectedSortList = [];
  List<String> sortSelectionList = [
    // "Latest Product",
    // "Best Selling",
    "Lowest Price",
    "Highest Price"
  ];
  int selectedPos = -1;
  double _lowerValue = 10;
  double _upperValue = 200;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCat();
  }

  @override
  Widget build(BuildContext context) {
    final productCtrl = context.read<ProductProvider>();
    List<Product?> subList = context.watch<ProductProvider>().productList;
    List<Product?> catList = context.watch<CategoryProvider>().subList;
    List<Product?> popularList = context.watch<CategoryProvider>().subList;
    catList
        .forEach((e) => filterList.addAll(e!.subList!.map((val) => val.name!)));
    // print("e :${e!.subList![0].name}"

    SizeConfig().init(context);
    double cellMargin2 = 7;
    double cellMargin = 7;
    var bottomDialogTextSize = SizeConfig.safeBlockVertical! * 45;
    var bottomDialogTextSizeFilter = SizeConfig.safeBlockVertical! * 55;
    var _crossAxisSpacing2 = 8.0;
    var _crossAxisSpacing = 8.0;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount2 = 6;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var _width2 =
        (_screenWidth - ((_crossAxisCount2 - 1) * _crossAxisSpacing2)) /
            _crossAxisCount2;
    var cellHeight = SizeConfig.safeBlockHorizontal! * 58;
    var cellHeight2 = Constants.getPercentSize1(bottomDialogTextSizeFilter, 13);
    var _aspectRatio = _width / cellHeight;
    var _aspectRatio2 = _width2 / cellHeight2;
    double mainCatWidth = (SizeConfig.safeBlockHorizontal! * 50) -
        (cellMargin * 2 + _crossAxisSpacing);
    double mainCatHeight = cellHeight;
    double topSliderWidth = SizeConfig.safeBlockHorizontal! * 23;
    double topSliderHeight = SizeConfig.safeBlockHorizontal! * 13;
    double imageSize = SizeConfig.safeBlockVertical! * 6.5;
    double imageSize1 = SizeConfig.safeBlockVertical! * 2.5;
    double marginSearch = SizeConfig.safeBlockHorizontal! * 5;

    return WillPopScope(
      child: Scaffold(
        backgroundColor: ConstantColors.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: getCustomText(S.of(context).shopping, textColor, 1,
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
                              onChanged: (val) {
                                productCtrl.setFilteredProductList(val);
                              },
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
                      itemCount: catList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedPos == index) {
                                selectedPos = -1;
                                productCtrl.setCategoryProductList([]);
                              } else {
                                productCtrl.setCategoryProductList([]);
                                selectedPos = index;
                                productCtrl.setCategoryProductList(
                                    catList[index]!.subList!);
                              }
                            });
                          },
                          child: Container(
                            width: topSliderWidth,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: (selectedPos == index)
                                    ? lightPrimaryColors
                                    : whiteColor),
                            margin: EdgeInsets.all(
                                Constants.getPercentSize1(topSliderWidth, 5)),
                            child: Align(
                              alignment: Alignment.center,
                              child: getCustomText(
                                  catList[index]!.name!,
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
                          Product? _subCatModle = subList[index];

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetail(_subCatModle),
                              ));
                            },
                            child: Container(
                              width: mainCatWidth,
                              height: mainCatHeight,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  color: cardColor,
                                  boxShadow: [
                                    BoxShadow(color: shadowColor, blurRadius: 2)
                                  ]
                                  // border: Border.all(color: Colors.grey, width: 1)
                                  ),
                              margin: EdgeInsets.all(
                                  Constants.getPercentSize(mainCatHeight, 3)),
                              padding: EdgeInsets.all(
                                  Constants.getPercentSize(mainCatHeight, 5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      child: Image.network(
                                        //
                                        _subCatModle!.image!,
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
                                      _subCatModle.name ?? "",
                                      textColor,
                                      1,
                                      TextAlign.start,
                                      FontWeight.w400,
                                      Constants.getPercentSize1(
                                          mainCatHeight, 7)),
                                  Row(
                                    children: [
                                      getSpace(Constants.getPercentSize1(
                                          mainCatHeight, 1.2)),
                                      getCustomText(
                                          INDIAN_RS_SYM +
                                              _subCatModle
                                                  .prVarientList![0].price
                                                  .toString(),
                                          colorOrange,
                                          1,
                                          TextAlign.start,
                                          FontWeight.w600,
                                          Constants.getPercentSize1(
                                              mainCatHeight, 8)),
                                      // Text(
                                      //   '{INDIAN_RS_SYM}' +
                                      //       (double.parse("10") -
                                      //               Constants.discountVal)
                                      //           .toString(),
                                      //   style: TextStyle(
                                      //       color: primaryTextColor,
                                      //       decoration:
                                      //           TextDecoration.lineThrough,
                                      //       fontFamily: Constants.fontsFamily,
                                      //       fontSize: Constants.getPercentSize1(
                                      //           mainCatHeight, 6),
                                      //       fontWeight: FontWeight.w600),
                                      //   maxLines: 1,
                                      // )
                                      // getCustomText(
                                      //     _subCatModle.price,
                                      //     primaryColor,
                                      //     1,
                                      //     TextAlign.start,
                                      //     FontWeight.w600,
                                      //     Constants.getPercentSize1(
                                      //         sellingItemHeight, 3)),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: accentColors),
                  width: SizeConfig.safeBlockHorizontal! * 45,
                  height: SizeConfig.safeBlockHorizontal! * 10,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_list_rounded,
                                color: Colors.white,
                              ),
                              getCustomText(
                                  S.of(context).sort,
                                  Colors.white,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w500,
                                  Constants.getPercentSize(
                                      SizeConfig.safeBlockHorizontal! * 15, 20))
                            ],
                          ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          getDialogDivider(
                                              SizeConfig.safeBlockHorizontal! *
                                                  20),
                                          getCustomText(
                                              S.of(context).sort,
                                              textColor,
                                              1,
                                              TextAlign.start,
                                              FontWeight.w500,
                                              Constants.getPercentSize(
                                                  bottomDialogTextSize, 7)),
                                          getCustomText(
                                              S
                                                  .of(context)
                                                  .arrangeBasedOnTheFollowingTypes,
                                              primaryTextColor,
                                              1,
                                              TextAlign.start,
                                              FontWeight.w300,
                                              Constants.getPercentSize(
                                                  bottomDialogTextSize, 5)),
                                          Container(
                                            child: ListView.builder(
                                              itemCount:
                                                  sortSelectionList.length,
                                              shrinkWrap: true,
                                              primary: true,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    if (!selectedSortList
                                                        .contains(
                                                            sortSelectionList[
                                                                index])) {
                                                      selectedSortList.add(
                                                          sortSelectionList[
                                                              index]);
                                                    } else {
                                                      selectedSortList.remove(
                                                          sortSelectionList[
                                                              index]);
                                                    }
                                                    final productCtrl =
                                                        context.read<
                                                            ProductProvider>();
                                                    productCtrl.sort(
                                                        isDesc: index == 1);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.all(
                                                        Constants.getPercentSize1(
                                                            bottomDialogTextSize,
                                                            1.2)),
                                                    padding: EdgeInsets.all(
                                                        Constants.getPercentSize1(
                                                            bottomDialogTextSize,
                                                            2.5)),
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    7))),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: getCustomText(
                                                              sortSelectionList[
                                                                  index],
                                                              textColor,
                                                              1,
                                                              TextAlign.start,
                                                              FontWeight.normal,
                                                              Constants
                                                                  .getPercentSize1(
                                                                      bottomDialogTextSize,
                                                                      5)),
                                                          flex: 1,
                                                        ),
                                                        Visibility(
                                                            visible: (selectedSortList
                                                                    .contains(
                                                                        sortSelectionList[
                                                                            index]))
                                                                ? true
                                                                : false,
                                                            maintainState: true,
                                                            maintainSize: true,
                                                            maintainAnimation:
                                                                true,
                                                            child: Icon(
                                                              Icons
                                                                  .check_circle,
                                                              size: Constants
                                                                  .getPercentSize1(
                                                                      bottomDialogTextSize,
                                                                      9),
                                                              color:
                                                                  accentColors,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                        flex: 1,
                      ),
                      Container(
                        width: 1,
                        color: Colors.white70,
                        height: double.infinity,
                      ),
                      Expanded(
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_list_alt,
                                color: Colors.white,
                              ),
                              getCustomText(
                                  S.of(context).filter,
                                  Colors.white,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w500,
                                  Constants.getPercentSize(
                                      SizeConfig.safeBlockHorizontal! * 15, 20))
                            ],
                          ),
                          onTap: catList.isEmpty
                              ? null
                              : () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              Constants.getPercentSize1(
                                                  bottomDialogTextSizeFilter,
                                                  10)),
                                          topLeft: Radius.circular(
                                              Constants.getPercentSize1(
                                                  bottomDialogTextSizeFilter,
                                                  10))),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return Container(
                                            height: bottomDialogTextSizeFilter,
                                            padding: EdgeInsets.only(
                                              top: Constants.getPercentSize1(
                                                  bottomDialogTextSizeFilter,
                                                  6),
                                              left: Constants.getPercentSize1(
                                                  bottomDialogTextSizeFilter,
                                                  6),
                                              right: Constants.getPercentSize1(
                                                  bottomDialogTextSizeFilter,
                                                  6),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      Constants.getPercentSize1(
                                                          bottomDialogTextSizeFilter,
                                                          10)),
                                                  topLeft: Radius.circular(
                                                      Constants.getPercentSize1(
                                                          bottomDialogTextSizeFilter,
                                                          10))),
                                              color: ConstantColors.bgColor,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                getDialogDivider(SizeConfig
                                                        .safeBlockHorizontal! *
                                                    20),
                                                getCustomText(
                                                    S.of(context).filter,
                                                    textColor,
                                                    1,
                                                    TextAlign.start,
                                                    FontWeight.w500,
                                                    Constants.getPercentSize(
                                                        bottomDialogTextSizeFilter,
                                                        6)),
                                                getCustomText(
                                                    S
                                                        .of(context)
                                                        .filterProductsWithMoreSpecificTypes,
                                                    primaryTextColor,
                                                    1,
                                                    TextAlign.start,
                                                    FontWeight.w300,
                                                    Constants.getPercentSize(
                                                        bottomDialogTextSizeFilter,
                                                        4)),
                                                getCustomText(
                                                    S.of(context).priceRange,
                                                    textColor,
                                                    1,
                                                    TextAlign.start,
                                                    FontWeight.w500,
                                                    Constants.getPercentSize(
                                                        bottomDialogTextSizeFilter,
                                                        3)),
                                                getSpace(18),
                                                SfRangeSlider(
                                                  values: SfRangeValues(
                                                      _lowerValue, _upperValue),
                                                  min: 0,
                                                  max: 300,
                                                  shouldAlwaysShowTooltip: true,
                                                  showLabels: true,
                                                  onChanged: (value) {
                                                    _lowerValue = value.start;
                                                    _upperValue = value.end;
                                                    setState(() {});
                                                  },
                                                ),
                                                // FlutterSlider(
                                                //   handlerHeight: 10,
                                                //   values: [_lowerValue, _upperValue],
                                                //   rangeSlider: true,
                                                //   max: 300,
                                                //   min: 0,
                                                //   step: FlutterSliderStep(step: 1),
                                                //   jump: false,
                                                //   trackBar: FlutterSliderTrackBar(
                                                //       activeTrackBarHeight: 8,
                                                //       activeTrackBar: BoxDecoration(
                                                //           borderRadius:
                                                //               BorderRadius.circular(
                                                //                   4),
                                                //           color: primaryColor),
                                                //       inactiveTrackBarHeight: 8,
                                                //       inactiveTrackBar: BoxDecoration(
                                                //           borderRadius:
                                                //               BorderRadius.circular(
                                                //                   4),
                                                //           color: viewColor)),
                                                //   tooltip: FlutterSliderTooltip(
                                                //       disableAnimation: true,
                                                //       alwaysShowTooltip: true,
                                                //       boxStyle: FlutterSliderTooltipBox(
                                                //           decoration: BoxDecoration(
                                                //               color: Colors
                                                //                   .transparent)),
                                                //       textStyle: TextStyle(
                                                //           fontFamily:
                                                //               Constants.fontsFamily,
                                                //           fontWeight: FontWeight.w800,
                                                //           fontSize: 15,
                                                //           color: textColor),
                                                //       format: (String value) {
                                                //         return '{INDIAN_RS_SYM}' + value;
                                                //       }),
                                                //   handler: FlutterSliderHandler(
                                                //     decoration: BoxDecoration(),
                                                //     child: Container(
                                                //       padding: EdgeInsets.all(10),
                                                //     ),
                                                //   ),
                                                //   rightHandler: FlutterSliderHandler(
                                                //     decoration: BoxDecoration(),
                                                //     child: Container(
                                                //       padding: EdgeInsets.all(10),
                                                //     ),
                                                //   ),
                                                //   disabled: false,
                                                //   onDragging: (handlerIndex,
                                                //       lowerValue, upperValue) {
                                                //     _lowerValue = lowerValue;
                                                //     _upperValue = upperValue;
                                                //     setState(() {});
                                                //   },
                                                // ),
                                                getCustomText(
                                                    S.of(context).brand,
                                                    textColor,
                                                    1,
                                                    TextAlign.start,
                                                    FontWeight.w500,
                                                    Constants.getPercentSize(
                                                        bottomDialogTextSizeFilter,
                                                        3)),

                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: MultiSelectDialogField(
                                                    items: filterList
                                                        .map((e) =>
                                                            MultiSelectItem(
                                                                e, e))
                                                        .toList(),
                                                    chipDisplay:
                                                        MultiSelectChipDisplay(),
                                                    onConfirm:
                                                        (List<dynamic> list) {},
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: getButtonWithColorWithSize(
                                                          S.of(context).reset,
                                                          accentColors,
                                                          Constants.getPercentSize1(
                                                              bottomDialogTextSizeFilter,
                                                              2.3),
                                                          Constants.getPercentSize1(
                                                              bottomDialogTextSizeFilter,
                                                              4), () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      }),
                                                      flex: 1,
                                                    ),
                                                    getHorizonSpace(SizeConfig
                                                            .safeBlockHorizontal! *
                                                        2),
                                                    Expanded(
                                                      child: getButtonWithColorWithSize(
                                                          S.of(context).apply,
                                                          accentColors,
                                                          Constants.getPercentSize1(
                                                              bottomDialogTextSizeFilter,
                                                              2.3),
                                                          Constants.getPercentSize1(
                                                              bottomDialogTextSizeFilter,
                                                              4), () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      }),
                                                      flex: 1,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              )
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

  Future<void> getCat() async {
    await Future.delayed(Duration.zero);
    Map parameter = {
      CAT_FILTER: 'false',
    };

    apiBaseHelper.postAPICall(getCatApi, parameter).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var data = getdata['data'];

          catList =
              (data as List).map((data) => Product.fromCat(data)).toList();
          print("catList :$catList");
          if (getdata.containsKey('popular_categories')) {
            var data = getdata['popular_categories'];
            popularList =
                (data as List).map((data) => Product.fromCat(data)).toList();

            if (popularList!.isNotEmpty) {
              Product pop =
                  Product.popular('Popular', '${imagePath}popular.svg');
              catList!.insert(0, pop);
              context.read<CategoryProvider>().setSubList(popularList);
            }
          }
        } else {
          setSnackbar(msg!, context);
        }

        // context.read<HomeProvider>().setCatLoading(false);
      },
      onError: (error) {
        setSnackbar(error.toString(), context);
        // context.read<HomeProvider>().setCatLoading(false);
      },
    );
  }
}
