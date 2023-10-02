import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/Model/Section_Model.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/data/PrefData.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/helper/String.dart';
import 'package:petcare/model/DiscModel.dart';
import 'package:petcare/model/Model.dart';
import 'package:petcare/model/ModelBlog.dart';
import 'package:petcare/model/ModelTopCategory.dart';
import 'package:petcare/model/SubCategoryModel.dart';
import 'package:petcare/screen/AdoptionList.dart';
import 'package:petcare/screen/BookPetTreatment.dart';
import 'package:petcare/screen/ProductDetail.dart';
import 'package:petcare/screen/ShoppingPage.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import '../Provider/SettingProvider.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHome createState() => _TabHome();
}

class _TabHome extends State<TabHome> {
  List<ModelTopCategory> topCatList = [];
  double screenHeight = 50;
  List<Model> discModelList = [];
  // List<DiscModel> discModelList = [];
  List<SubCategoryModel> subList = DataFile.getSubCategoryModel();
  List<DiscModel> adoptModelList = [];
  List<ModelBlog> blogLists = [];
  List<Product>? bestSellingList = [];

  @override
  void initState() {
    super.initState();
    getOfferImages();
    // discModelList = DataFile.getDiscModel();
    adoptModelList = DataFile.getAdoptModel();
    getBestSellingProducts();
  }

  Widget getTitles(String str) {
    return getCustomText(str, textColor, 1, TextAlign.start, FontWeight.w500,
        Constants.getPercentSize1(SizeConfig.safeBlockVertical! * 100, 2));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    PrefData().setSelectedMainCategory(Constants.NONE_CAT);

    topCatList = DataFile.getTopCategoryList(context);
    blogLists = DataFile.getBlogList(context);
    screenHeight = SizeConfig.safeBlockVertical! * 100;
    double screenWidth = SizeConfig.safeBlockHorizontal! * 100;
    double padding = Constants.getPercentSize1(screenWidth, 1.6);
    double topListHeight = screenWidth / 4;
    double topListItemHeight = Constants.getPercentSize(topListHeight, 40);
    double sliderHeight = Constants.getPercentSize(screenHeight, 20);
    double slider2Height = Constants.getPercentSize(screenHeight, 27);
    double sellingItemWidth = SizeConfig.safeBlockHorizontal! * 42;
    double sellingItemHeight = SizeConfig.safeBlockHorizontal! * 50;
    print("discmodel $discModelList");
    final List<Widget> imageSliders = discModelList
        .map((item) => Container(
                child: Container(
              margin: EdgeInsets.all(7),
              child: InkWell(
                onTap: () {},
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal! * 3),
                          width: MediaQuery.of(context).size.width * 1,
                          // margin: EdgeInsets.all(
                          //     MediaQuery.of(context).size.width * 0.05),
                          //
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(item.image!),
                              fit: BoxFit.cover,
                            ),
                          ),

                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        Constants.assetsImagePath +
                                            "bg_shape.png",
                                      ),
                                      // colorFilter: ColorFilter.mode(
                                      //     Colors.black.withOpacity(0.5),
                                      //     BlendMode.srcOver),
                                      fit: BoxFit.cover)),
                              padding: EdgeInsets.only(right: 5),
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: Constants.getPercentSize(
                              //         SizeConfig.safeBlockHorizontal * 40, 2)),
                              width: SizeConfig.safeBlockHorizontal! * 40,
                              child: Row(
                                children: [
                                  getHorizonSpace(Constants.getPercentSize(
                                      SizeConfig.safeBlockHorizontal! * 40,
                                      24)),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Padding(
                                        //   padding: EdgeInsets.all(0),
                                        //   child: getCustomText(
                                        //       item.name,
                                        //       textColor,
                                        //       1,
                                        //       TextAlign.start,
                                        //       FontWeight.w400,
                                        //       Constants.getPercentSize(
                                        //           sliderHeight, 9)),
                                        // ),
                                        // getSpace(Constants.getPercentSize(
                                        //     sliderHeight, 3)),
                                        // Padding(
                                        //   padding: EdgeInsets.all(0),
                                        //   child: getCustomText(
                                        //       item.name ?? "",
                                        //       Colors.white,
                                        //       1,
                                        //       TextAlign.start,
                                        //       FontWeight.w600,
                                        //       Constants.getPercentSize(
                                        //           sliderHeight, 7)),
                                        // ),
                                        // Padding(
                                        //   padding: EdgeInsets.all(0),
                                        //   child: getCustomText(
                                        //       item.desc ?? "",
                                        //       Colors.white,
                                        //       1,
                                        //       TextAlign.start,
                                        //       FontWeight.w400,
                                        //       Constants.getPercentSize(
                                        //           sliderHeight, 6)),
                                        // ),
                                        // getSpace(Constants.getPercentSize1(
                                        //     sliderHeight, 1.5))
                                      ],
                                    ),
                                    flex: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            )))
        .toList();

    final List<Widget> adoptSliders = adoptModelList
        .map((item) => Container(
                child: Container(
              margin: EdgeInsets.all(7),
              child: InkWell(
                onTap: () {},
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal! * 3),
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  Constants.assetsImagePath + item.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: SizeConfig.safeBlockHorizontal * 3),
                          // width: SizeConfig.safeBlockHorizontal * 45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Expanded(
                                  //   child:
                                  Container(
                                    width: SizeConfig.safeBlockHorizontal! * 45,
                                    color: Colors.black54,
                                    padding: EdgeInsets.only(left: 7),
                                    child: getCustomText(
                                        item.name!,
                                        Colors.white,
                                        2,
                                        TextAlign.start,
                                        FontWeight.w700,
                                        Constants.getPercentSize1(
                                            SizeConfig.safeBlockHorizontal! *
                                                40,
                                            10)),
                                  ),
                                  // , flex: 1,),
                                  Container(
                                    padding: EdgeInsets.only(right: 3),
                                    width: SizeConfig.safeBlockHorizontal! * 25,
                                    // width: SizeConfig.safeBlockHorizontal * 30,
                                    child: getButtonWithColorWithSize(
                                        S.of(context).services,
                                        accentColors,
                                        Constants.getPercentSize1(
                                            slider2Height, 2),
                                        Constants.getPercentSize1(
                                            SizeConfig.safeBlockHorizontal! *
                                                30,
                                            9),
                                        // SizeConfig.safeBlockHorizontal * 30, 9),
                                        () {
                                      sendToAdopt();
                                    }),
                                  ),
                                  // getHorizonSpace(1)
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            )))
        .toList();
    SettingProvider settingProvider =
        Provider.of<SettingProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: ConstantColors.bgColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          primary: true,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: padding, right: padding, top: padding),
              child: RichText(
                text: new TextSpan(
                  text: "Hello ",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Constants.getPercentSize(screenHeight, 3),
                      fontFamily: Constants.fontsFamily),
                  children: <TextSpan>[
                    new TextSpan(
                        text: settingProvider.userName + ",",
                        style: TextStyle(
                            color: accentColors,
                            fontWeight: FontWeight.w600,
                            fontSize: Constants.getPercentSize(screenHeight, 3),
                            fontFamily: Constants.fontsFamily)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: padding, vertical: padding / 3),
              child: getCustomText(
                  S.of(context).whatAreYouLookingFor,
                  primaryTextColor,
                  1,
                  TextAlign.start,
                  FontWeight.normal,
                  Constants.getPercentSize1(screenHeight, 1.8)),
            ),
            Container(
              height: topListHeight,
              child: ListView.builder(
                padding:
                    EdgeInsets.all(Constants.getPercentSize1(topListHeight, 5)),
                scrollDirection: Axis.horizontal,
                primary: false,
                itemCount: topCatList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                          PrefData()
                              .setSelectedMainCategory(Constants.SHOPPING_ID);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShoppingPage(),
                          ));
                          break;
                        case 1:
                          PrefData()
                              .setSelectedMainCategory(Constants.GROOMING_ID);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookPetTreatment(),
                          ));

                          break;
                        case 2:
                          PrefData()
                              .setSelectedMainCategory(Constants.PET_WALKER_ID);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookPetTreatment(),
                          ));
                          break;
                        case 3:
                          sendToAdopt();

                          break;
                      }
                    },
                    child: Container(
                      width: topListHeight -
                          Constants.getPercentSize1(topListHeight, 5),
                      height: topListHeight -
                          Constants.getPercentSize1(topListHeight, 5),
                      margin: EdgeInsets.all(
                          Constants.getPercentSize1(topListHeight, 5)),
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          // border:
                          //     Border.all(color: Colors.grey, width: 0.8),
                          color: cardColor,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(color: shadowColor, blurRadius: 1.2)
                            // BoxShadow(color: "#B9B9B9".toColor(), blurRadius:1.2)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: topListItemHeight,
                            width: topListItemHeight,

                            child:
                                // Padding(
                                //   padding: EdgeInsets.all(Constants.getPercentSize1(
                                //       topListItemHeight, 24)),
                                //   child:
                                Image.asset(
                              Constants.assetsImagePath +
                                  topCatList[index].image,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            // ),
                          ),
                          getSpace(Constants.getPercentSize1(topListHeight, 5)),
                          getCustomText(
                              topCatList[index].title,
                              textColor,
                              1,
                              TextAlign.start,
                              FontWeight.w400,
                              Constants.getPercentSize1(
                                  topListHeight - topListItemHeight, 20))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: getTitles(S.of(context).latestOffers),
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: sliderHeight,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  aspectRatio: 1.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {});
                  },
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: imageSliders,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: getTitles(S.of(context).bestSellingItems),
            ),
            Container(
              height: sellingItemHeight,
              margin: EdgeInsets.all(
                  Constants.getPercentSize(sellingItemHeight, 3)),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                primary: false,
                itemCount: bestSellingList!.length,
                itemBuilder: (context, index) {
                  Product _subCatModle = bestSellingList![index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetail(_subCatModle),
                      ));
                    },
                    child: Container(
                      width: sellingItemWidth,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: cardColor,
                          boxShadow: [
                            BoxShadow(color: shadowColor, blurRadius: 2)
                          ]
                          // border: Border.all(color: Colors.grey, width: 1),
                          ),
                      margin: EdgeInsets.all(
                          Constants.getPercentSize(sellingItemHeight, 3)),
                      padding: EdgeInsets.all(
                          Constants.getPercentSize(sellingItemWidth, 5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              child: Image.network(
                                _subCatModle.image!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            flex: 1,
                          ),
                          getSpace(Constants.getPercentSize1(
                              sellingItemHeight, 2.5)),
                          getCustomText(
                              _subCatModle.name ?? "",
                              textColor,
                              1,
                              TextAlign.start,
                              FontWeight.w400,
                              Constants.getPercentSize1(sellingItemHeight, 7)),
                          Row(
                            children: [
                              getSpace(Constants.getPercentSize1(
                                  sellingItemHeight, 1.2)),
                              getCustomText(
                                  INDIAN_RS_SYM +
                                      _subCatModle.prVarientList![0].price!,
                                  colorOrange,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w600,
                                  Constants.getPercentSize1(
                                      sellingItemHeight, 8)),
                              // Text(
                              //   INDIAN_RS_SYM
                              //   // (_subCatModle.maxPrice! -
                              //   //         Constants.discountVal)
                              //   ,
                              //   style: TextStyle(
                              //       color: primaryTextColor,
                              //       decoration: TextDecoration.lineThrough,
                              //       fontFamily: Constants.fontsFamily,
                              //       fontSize: Constants.getPercentSize1(
                              //           sellingItemHeight, 6),
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
            // CarouselSlider(
            //   options: CarouselOptions(
            //       height: sliderHeight,
            //       autoPlay: false,
            //       autoPlayInterval: Duration(seconds: 5),
            //       aspectRatio: 1.0,
            //       enlargeCenterPage: false,
            //       onPageChanged: (index, reason) {
            //         setState(() {});
            //       },
            //       enlargeStrategy: CenterPageEnlargeStrategy.height
            //   ),
            //   items: adoptSliders,
            // ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Container(
                  height: sliderHeight,
                  margin: EdgeInsets.all(7),
                  child: InkWell(
                    onTap: () {},
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal! * 3),
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: AssetImage(Constants.assetsImagePath +
                                      adoptModelList[0].image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: SizeConfig.safeBlockHorizontal * 3),
                              // width: SizeConfig.safeBlockHorizontal * 45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Expanded(
                                      //   child:
                                      Container(
                                        width: SizeConfig.safeBlockHorizontal! *
                                            45,
                                        color: Colors.black54,
                                        padding: EdgeInsets.only(left: 7),
                                        child: getCustomText(
                                            adoptModelList[0].name ?? "",
                                            Colors.white,
                                            2,
                                            TextAlign.start,
                                            FontWeight.w700,
                                            Constants.getPercentSize1(
                                                SizeConfig
                                                        .safeBlockHorizontal! *
                                                    40,
                                                10)),
                                      ),
                                      // , flex: 1,),
                                      Container(
                                        padding: EdgeInsets.only(right: 3),
                                        width: SizeConfig.safeBlockHorizontal! *
                                            25,
                                        // width: SizeConfig.safeBlockHorizontal * 30,
                                        child: getButtonWithColorWithSize(
                                            S.of(context).services,
                                            accentColors,
                                            Constants.getPercentSize1(
                                                slider2Height, 2),
                                            Constants.getPercentSize1(
                                                SizeConfig
                                                        .safeBlockHorizontal! *
                                                    30,
                                                9),
                                            // SizeConfig.safeBlockHorizontal * 30, 9),
                                            () {
                                          sendToAdopt();
                                        }),
                                      ),
                                      // getHorizonSpace(1)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void sendToAdopt() {
    PrefData().setSelectedMainCategory(Constants.ADOPTION_ID);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AdoptionList(),
    ));
  }

  void getOfferImages() {
    Map parameter = {};

    apiBaseHelper.postAPICall(getOfferImageApi, parameter).then((getdata) {
      bool error = getdata['error'];
      String? msg = getdata['message'];
      if (!error) {
        var data = getdata['data'];
        discModelList.clear();
        discModelList =
            (data as List).map((data) => Model.fromSlider(data)).toList();
      } else {
        setSnackbar(msg!, context);
      }
      setState(() {});
      // context.read<HomeProvider>().setOfferLoading(false);
    }, onError: (error) {
      setSnackbar(error.toString(), context);
      // context.read<HomeProvider>().setOfferLoading(false);
    });
  }

  void getBestSellingProducts() {
    apiBaseHelper.postAPICall(getBestSellingProductsApi, {}).then((getdata) {
      bool error = getdata['error'];
      String? msg = getdata['message'];
      if (!error) {
        var data = getdata['data'];
        print("hello $data");
        bestSellingList =
            (data as List).map((data) => Product.fromJson(data)).toList();
        // print("BestSelling: $bestSellingList");
        bestSellingList = bestSellingList!.map(
          (e) {
            e.prVarientList!.sortBy<num>((x) => double.parse(x.price!));
            return e;
          },
        ).toList();
        setState(() {});
      } else {
        if (msg != 'Products Not Found !') setSnackbar(msg!, context);
      }
    }, onError: (error) {
      setSnackbar(error.toString(), context);
      setState(() {});
      //context.read<ProductListProvider>().setProductLoading(false);
    });
  }
}
