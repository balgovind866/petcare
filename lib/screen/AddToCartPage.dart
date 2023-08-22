import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/SubCategoryModel.dart';
import 'package:petcare/screen/CheckOutPage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddToCartPage extends StatefulWidget {
  // final bool isCheckout;

  AddToCartPage();

  @override
  _AddToCartPage createState() {
    return _AddToCartPage();
  }
}

class _AddToCartPage extends State<AddToCartPage> {
  List<SubCategoryModel> cartModelList = [];

  _AddToCartPage();

  @override
  void initState() {
    super.initState();

    cartModelList = DataFile.getCartModel();

    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = MediaQuery.of(context).size.width * 0.04;
    double imageSize = SizeConfig.safeBlockVertical! * 8;
    double topBottomPadding = SizeConfig.safeBlockVertical! * 2;
    double fontTitleSize =
        Constants.getPercentSize1(SizeConfig.safeBlockVertical! * 100, 1.8);
    double fontDataTitleSize =
        Constants.getPercentSize1(SizeConfig.safeBlockVertical! * 100, 1.5);
    double fontTotalTitleSize =
        Constants.getPercentSize1(SizeConfig.safeBlockVertical! * 100, 1.9);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            backgroundColor: ConstantColors.bgColor,
            elevation: 0,
            centerTitle: true,
            title: getCustomText(S.of(context).cart, textColor, 1,
                TextAlign.start, FontWeight.bold, 18),
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
            // margin: EdgeInsets.only(
            //     bottom: leftMargin, left: leftMargin, right: leftMargin),
            // padding: EdgeInsets.only(bottom: leftMargin),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: leftMargin,
                        right: leftMargin,
                        bottom: MediaQuery.of(context).size.width * 0.01),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartModelList.length,
                        itemBuilder: (context, index) {
                          return ListItem(
                              imageSize, cartModelList[index], removeItem);
                        }),
                  ),
                  flex: 1,
                ),
                Container(
                  padding: EdgeInsets.all(SizeConfig.safeBlockVertical! * 3),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: getCustomText(
                                S.of(context).subTotal,
                                primaryTextColor,
                                1,
                                TextAlign.start,
                                FontWeight.w500,
                                fontTitleSize),
                            flex: 1,
                          ),
                          Expanded(
                            child: getCustomText(
                                "\$88.10",
                                primaryTextColor,
                                1,
                                TextAlign.end,
                                FontWeight.w500,
                                fontDataTitleSize),
                            flex: 1,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: topBottomPadding, bottom: topBottomPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: getCustomText(
                                  S.of(context).shippingFee,
                                  primaryTextColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.w500,
                                  fontTitleSize),
                              flex: 1,
                            ),
                            Expanded(
                              child: getCustomText(
                                  "\$9.90",
                                  primaryTextColor,
                                  1,
                                  TextAlign.end,
                                  FontWeight.w500,
                                  fontDataTitleSize),
                              flex: 1,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: getCustomText(
                                S.of(context).estimatingTax,
                                primaryTextColor,
                                1,
                                TextAlign.start,
                                FontWeight.w500,
                                fontTitleSize),
                            flex: 1,
                          ),
                          Expanded(
                            child: getCustomText(
                                "\$6.50",
                                primaryTextColor,
                                1,
                                TextAlign.end,
                                FontWeight.w500,
                                fontDataTitleSize),
                            flex: 1,
                          )
                        ],
                      ),
                      getSpace(topBottomPadding),
                      //
                      // Container(
                      //   margin: EdgeInsets.only(top: topBottomPadding, bottom: topBottomPadding),
                      //   height: 1,
                      //   color: viewColor,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: getCustomText(
                                S.of(context).total,
                                textColor,
                                1,
                                TextAlign.start,
                                FontWeight.bold,
                                fontTotalTitleSize),
                            flex: 1,
                          ),
                          Expanded(
                            child: getCustomText(
                                "\$104.50",
                                textColor,
                                1,
                                TextAlign.end,
                                FontWeight.bold,
                                fontTotalTitleSize),
                            flex: 1,
                          )
                        ],
                      ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.safeBlockVertical! * 1.5),
                          height: SizeConfig.safeBlockVertical! * 7,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: getCustomText(
                                S.of(context).chekout,
                                Colors.white,
                                1,
                                TextAlign.start,
                                FontWeight.w900,
                                Constants.getPercentSize(
                                    SizeConfig.safeBlockVertical! * 7, 30)),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckOutPage()));
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  void removeItem(SubCategoryModel index) {
    cartModelList.remove(index);
    setState(() {});
  }
}

class ListItem extends StatefulWidget {
  final double imageSize;
  final SubCategoryModel subCategoryModel;

  final ValueChanged<SubCategoryModel> onChanged;

  ListItem(this.imageSize, this.subCategoryModel, this.onChanged);

  @override
  RoomEditDeleteItemState createState() => RoomEditDeleteItemState(
      this.imageSize, this.subCategoryModel, this.onChanged);
}

class RoomEditDeleteItemState extends State<ListItem> {
  double imageSize;
  final ValueChanged<SubCategoryModel> onChanged;
  SubCategoryModel subCategoryModel;
  double radius = 7;

  RoomEditDeleteItemState(
      this.imageSize, this.subCategoryModel, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Slidable(
      child: Center(
          child: InkWell(
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: imageSize,
                    width: imageSize,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: accentColors,
                        borderRadius: BorderRadius.all(
                          Radius.circular(radius),
                        ),
                        image: DecorationImage(
                            image: AssetImage(Constants.assetsImagePath +
                                subCategoryModel.image[0]),
                            fit: BoxFit.cover)),
                    // child: Image.asset(
                    //     Constants.assetsImagePath + subCategoryModel.image,height: double.infinity,width: double.infinity,),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getCustomText(
                                subCategoryModel.name ?? "",
                                textColor,
                                1,
                                TextAlign.start,
                                FontWeight.bold,
                                Constants.getScreenPercentSize(context, 2)),
                            Padding(
                              padding: EdgeInsets.only(top: 2, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: getCustomText(
                                        subCategoryModel.priceCurrency! +
                                            subCategoryModel.price.toString(),
                                        textColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w500,
                                        15),
                                    flex: 1,
                                  ),

                                  // new Spacer(),
                                  InkWell(
                                    child: Container(
                                        // height: 25,
                                        // width: 80,
                                        margin: EdgeInsets.only(
                                          right: 15,
                                        ),
                                        padding: EdgeInsets.all(5),
                                        child: InkWell(
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                child: Container(
                                                  height: Constants
                                                      .getScreenPercentSize(
                                                          context, 3.5),
                                                  width: Constants
                                                      .getScreenPercentSize(
                                                          context, 3.5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.grey)),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 15,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    if (subCategoryModel
                                                            .quantity >
                                                        1) {
                                                      subCategoryModel
                                                          .quantity--;
                                                    }
                                                  });
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: getCustomTextWithoutAlign(
                                                    subCategoryModel.quantity
                                                        .toString(),
                                                    primaryTextColor,
                                                    FontWeight.w400,
                                                    Constants
                                                        .getScreenPercentSize(
                                                            context, 1.5)),
                                              ),
                                              InkWell(
                                                child: Container(
                                                  height: Constants
                                                      .getScreenPercentSize(
                                                          context, 3.5),
                                                  width: Constants
                                                      .getScreenPercentSize(
                                                          context, 3.5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: accentColors)),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 15,
                                                      color: accentColors,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  subCategoryModel.quantity++;
                                                  setState(() {});
                                                },
                                              )
                                            ],
                                          )),
                                        )),
                                    onTap: () {},
                                  ),

                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    flex: 1,
                  )
                ],
              ),
            ],
          ),
        ),
        onTap: () {},
      )),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          InkWell(
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration: BoxDecoration(
                color: textColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: ConstantColors.bgColor,
              ),
            ),
            onTap: () {
              widget.onChanged(subCategoryModel);
            },
          )
        ],
      ),
    ));

    // return InkWell(
    //     child: Slidable(
    //   actionPane: SlidableDrawerActionPane(),
    //   child: Center(
    //       child: InkWell(
    //     child: Container(
    //       margin: EdgeInsets.only(top: 10, bottom: 10),
    //       decoration: new BoxDecoration(
    //           color: whiteColor,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.black12,
    //               offset: Offset(1, 1),
    //               blurRadius: 1,
    //             )
    //           ],
    //           borderRadius: BorderRadius.all(Radius.circular(10.0))),
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //               Container(
    //                 height: imageSize,
    //                 width: imageSize,
    //                 margin: EdgeInsets.all(15),
    //                 decoration: BoxDecoration(
    //                   shape: BoxShape.rectangle,
    //                   color: Colors.transparent,
    //                   image: DecorationImage(
    //                     image: ExactAssetImage(Constants.assetsImagePath+subCategoryModel.image),
    //                     fit: BoxFit.cover,
    //                   ),
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(5),
    //                   ),
    //                 ),
    //               ),
    //               Expanded(
    //                 child: Stack(
    //                   children: [
    //                     Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         getCustomText(subCategoryModel.name, textColor, 1, TextAlign.start, FontWeight.w500, 12),
    //                         Padding(
    //                           padding: EdgeInsets.only(top: 10, right: 15),
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.start,
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             children: [
    //                               InkWell(
    //                                 child: Container(
    //                                     height: 25,
    //                                     // width: 80,
    //                                     margin: EdgeInsets.only(
    //                                       right: 15,
    //                                     ),
    //                                     padding: EdgeInsets.all(5),
    //                                     // decoration: BoxDecoration(
    //                                     //   color: ConstantData.textColor,
    //                                     //   borderRadius: BorderRadius.all(
    //                                     //     Radius.circular(10),
    //                                     //   ),
    //                                     // ),
    //
    //                                     decoration: BoxDecoration(
    //                                         border: Border.all(
    //                                             color:primaryTextColor),
    //                                         borderRadius: BorderRadius.all(
    //                                             Radius.circular(5))),
    //                                     child: InkWell(
    //                                       child: Center(
    //                                           child: Row(
    //                                         mainAxisAlignment:
    //                                             MainAxisAlignment.center,
    //                                         crossAxisAlignment:
    //                                             CrossAxisAlignment.center,
    //                                         children: [
    //                                           InkWell(
    //                                             child: Container(
    //                                               height: 15,
    //                                               width: 15,
    //                                               child: Center(
    //                                                 child: Icon(
    //                                                   Icons.remove,
    //                                                   size: 10,
    //                                                   color: primaryTextColor,
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             onTap: () {
    //                                               setState(() {
    //                                                 if (subCategoryModel
    //                                                         .quantity >
    //                                                     1) {
    //                                                   subCategoryModel
    //                                                       .quantity--;
    //                                                 }
    //                                               });
    //                                             },
    //                                           ),
    //                                           Padding(
    //                                             padding: EdgeInsets.only(
    //                                                 left: 10, right: 10),
    //                                             child: getCustomText(subCategoryModel.quantity
    //                                                 .toString(), textColor, 1, TextAlign.start, FontWeight.w400, 10),
    //                                           ),
    //
    //                                           // InkWell(
    //                                           //     child: Icon(
    //                                           //       CupertinoIcons.add,
    //                                           //       color:
    //                                           //       ConstantData.textColor,
    //                                           //       size: 15,
    //                                           //     ),
    //                                           //     onTap: () {
    //                                           //       subCategoryModel.quantity++;
    //                                           //
    //                                           //       setState(() {});
    //                                           //     }),
    //
    //                                           InkWell(
    //                                             child: Container(
    //                                               height: 15,
    //                                               width: 15,
    //                                               // decoration: BoxDecoration(
    //                                               //     color: Colors.transparent,
    //                                               //     shape: BoxShape.circle,
    //                                               //     border: Border.all(
    //                                               //         width: 1,
    //                                               //         color: ConstantData
    //                                               //             .primaryTextColor)
    //                                               // ),
    //                                               child: Center(
    //                                                 child: Icon(
    //                                                   Icons.add,
    //                                                   size: 10,
    //                                                   color: primaryTextColor,
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                             onTap: () {
    //                                               subCategoryModel.quantity++;
    //                                               setState(() {});
    //                                             },
    //                                           )
    //                                         ],
    //                                       )),
    //                                     )),
    //                                 onTap: () {},
    //                               ),
    //                               new Spacer(),
    //                               Text(
    //                                 subCategoryModel.price,
    //                                 textAlign: TextAlign.start,
    //                                 style: TextStyle(
    //                                   fontFamily: "SFProText",
    //                                   fontWeight: FontWeight.bold,
    //                                   fontSize: 15,
    //                                   color:textColor,
    //                                 ),
    //                               ),
    //
    //                               // )
    //                             ],
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 flex: 1,
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     onTap: () {},
    //   )),
    //   secondaryActions: <Widget>[
    //     InkWell(
    //       child: Container(
    //         height: 40,
    //         width: 40,
    //         margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
    //         decoration: BoxDecoration(
    //           color:textColor,
    //           shape: BoxShape.circle,
    //         ),
    //         child: Icon(
    //           Icons.close,
    //           color: ConstantColors.bgColor,
    //         ),
    //       ),
    //       onTap: () {
    //         widget.onChanged(subCategoryModel);
    //       },
    //     )
    //   ],
    // ));
  }
}
