import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/Model/Section_Model.dart';
import 'package:petcare/Provider/CartProvider.dart';
import 'package:petcare/Provider/UserProvider.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/helper/String.dart';
import 'package:petcare/screen/CheckOutPage.dart';
import 'package:provider/provider.dart';

import 'checkOutPageSelling.dart';

class AddToCartPage extends StatefulWidget {
  // final bool isCheckout;

  AddToCartPage();

  @override
  _AddToCartPage createState() {
    return _AddToCartPage();
  }
}

double totalPrice = 0, oriPrice = 0, delCharge = 0, taxPer = 0, taxTotal = 0;
List<Promo> promoList = [];

class _AddToCartPage extends State<AddToCartPage> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool _isCartLoad = true, _placeOrder = true, _isSaveLoad = true;
  List<SectionModel> cartModelList = [];

  _AddToCartPage();

  bool _isNetworkAvail = true;
  final List<TextEditingController> _controller = [];
  bool isLoader = false;
  @override
  void initState() {
    super.initState();
    _getCart('0');
    // cartModelList = DataFile.getCartModel();

    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    cartModelList = context.watch<CartProvider>().cartList;
    print("Cart data :${cartModelList}");
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
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: leftMargin,
                            right: leftMargin,
                            bottom: MediaQuery.of(context).size.width * 0.01),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartModelList.length,
                            itemBuilder: (context, index) {
                              return Row(
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
                                          Radius.circular(7),
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                cartModelList[index]
                                                    .productList![0]
                                                    .image!),
                                            fit: BoxFit.cover)),
                                    // child: Image.asset(
                                    //     Constants.assetsImagePath + subCategoryModel.image,height: double.infinity,width: double.infinity,),
                                  ),
                                  Expanded(
                                    child: Stack(children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          getCustomText(
                                              cartModelList[index]
                                                      .productList![0]
                                                      .name ??
                                                  "",
                                              textColor,
                                              1,
                                              TextAlign.start,
                                              FontWeight.bold,
                                              Constants.getScreenPercentSize(
                                                  context, 2)),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 2, right: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: getCustomText(
                                                      INDIAN_RS_SYM +
                                                          cartModelList[index]
                                                              .singleItemNetAmount!
                                                              .toString(),
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
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: InkWell(
                                                        child: Center(
                                                            child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              child: Container(
                                                                height: Constants
                                                                    .getScreenPercentSize(
                                                                        context,
                                                                        3.5),
                                                                width: Constants
                                                                    .getScreenPercentSize(
                                                                        context,
                                                                        3.5),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        width:
                                                                            1,
                                                                        color: Colors
                                                                            .grey)),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    size: 15,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                ),
                                                              ),
                                                              onTap: () {
                                                                // if (int.parse(
                                                                //         sectionModel.qty!) >
                                                                //     1) {

                                                                updateCart(
                                                                        cartModelList[index]
                                                                            .varientId!,
                                                                        int.parse(cartModelList[index].qty!) -
                                                                            1)
                                                                    .then(
                                                                        (val) {
                                                                  _getCart('0');
                                                                });

                                                                print(
                                                                    "Product var id ${cartModelList[index].varientId!}");
                                                                // }
                                                              },
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 15,
                                                                      right:
                                                                          15),
                                                              child: getCustomTextWithoutAlign(
                                                                  cartModelList[
                                                                          index]
                                                                      .qty
                                                                      .toString(),
                                                                  primaryTextColor,
                                                                  FontWeight
                                                                      .w400,
                                                                  Constants
                                                                      .getScreenPercentSize(
                                                                          context,
                                                                          1.5)),
                                                            ),
                                                            InkWell(
                                                              child: Container(
                                                                height: Constants
                                                                    .getScreenPercentSize(
                                                                        context,
                                                                        3.5),
                                                                width: Constants
                                                                    .getScreenPercentSize(
                                                                        context,
                                                                        3.5),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        width:
                                                                            1,
                                                                        color:
                                                                            accentColors)),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    size: 15,
                                                                    color:
                                                                        accentColors,
                                                                  ),
                                                                ),
                                                              ),
                                                              onTap: () {
                                                                updateCart(
                                                                        cartModelList[index]
                                                                            .varientId!,
                                                                        int.parse(cartModelList[index].qty!) +
                                                                            1)
                                                                    .then(
                                                                        (val) {
                                                                  _getCart('0');
                                                                });
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
                                    ]),
                                  ),
                                ],
                              );

                              // ListItem(imageSize, cartModelList[index],
                              //     removeItem, () => _getCart("0"));
                            }),
                      ),
                      if (isLoader) Center(child: CircularProgressIndicator())
                    ],
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
                                INDIAN_RS_SYM + oriPrice.toString(),
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
                                  INDIAN_RS_SYM + delCharge.toString(),
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
                                INDIAN_RS_SYM + taxTotal.toString(),
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
                                INDIAN_RS_SYM + totalPrice.toString(),
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
                              color: cartModelList.isEmpty
                                  ? Colors.grey
                                  : primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: getCustomText(
                                S.of(context).checkout,
                                Colors.white,
                                1,
                                TextAlign.start,
                                FontWeight.w900,
                                Constants.getPercentSize(
                                    SizeConfig.safeBlockVertical! * 7, 30)),
                          ),
                        ),
                        onTap: cartModelList.isEmpty
                            ? null
                            : () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CheckOutPageBestSelling()));
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

  void removeItem(SectionModel index) {
    cartModelList.remove(index);
    setState(() {});
  }

  Future<void> updateCart(String productId, int qty) async {
    var parameter = {
      USER_ID: CUR_USERID,
      PRODUCT_VARIENT_ID: productId,
      QTY: qty.toString(),
    };
    apiBaseHelper.postAPICall(manageCartApi, parameter).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var data = getdata['data'];
          print("Data added to cart $data");
          // widget.model!.prVarientList![_oldSelVarient].cartCount =
          //     qty.toString();

          context.read<UserProvider>().setCartCount(data['cart_count']);
          var cart = getdata['cart'];
          List<SectionModel> cartList = [];
          cartList = (cart as List)
              .map((cart) => SectionModel.fromCart(cart))
              .toList();
          context.read<CartProvider>().setCartlist(cartList);
        } else {
          setSnackbar(msg!, context);
        }
      },
      onError: (error) async {
        if (error.toString() == "Invalid number") {}
        setSnackbar(error.toString(), context);
      },
    );
  }

  Future<void> _getCart(String save) async {
    _isNetworkAvail = await isNetworkAvailable();
    setState(() {
      isLoader = true;
    });

    if (_isNetworkAvail) {
      try {
        var parameter = {USER_ID: CUR_USERID, SAVE_LATER: save};

        apiBaseHelper.postAPICall(getCartApi, parameter).then((getdata) {
          bool error = getdata['error'];
          String? msg = getdata['message'];
          if (!error) {
            var data = getdata['data'];

            oriPrice = double.parse(getdata[SUB_TOTAL]);

            taxPer = double.parse(getdata[TAX_PER]);
            taxTotal = double.parse(getdata["tax_amount"]);

            delCharge = double.parse(getdata["delivery_charge"]);

            totalPrice = delCharge + oriPrice;
            isLoader = false;

            List<SectionModel> cartList = (data as List)
                .map((data) => SectionModel.fromCart(data))
                .toList();

            context.read<CartProvider>().setCartlist(cartList);

            if (getdata.containsKey(PROMO_CODES)) {
              var promo = getdata[PROMO_CODES];
              promoList =
                  (promo as List).map((e) => Promo.fromJson(e)).toList();
            }

            for (int i = 0; i < cartList.length; i++) {
              _controller.add(TextEditingController());
            }
            setState(() {});
          } else {
            setState(() {
              oriPrice = 0;
              taxPer = 0;
              taxTotal = 0;

              delCharge = 0;

              totalPrice = delCharge + oriPrice;
              isLoader = false;
            });
            if (msg != 'Cart Is Empty !') setSnackbar(msg!, context);
          }
          if (mounted) {
            setState(() {
              _isCartLoad = false;
            });
          }
        }, onError: (error) {
          setSnackbar(error.toString(), context);
        });
      } on TimeoutException catch (_) {
        setSnackbar(getTranslated(context, 'somethingMSg')!, context);
      }
    } else {
      if (mounted) {
        setState(() {
          _isNetworkAvail = false;
        });
      }
    }
  }

// Future<void> _getAddress() async {
//   _isNetworkAvail = await isNetworkAvailable();
//   if (_isNetworkAvail) {
//     try {
//       var parameter = {
//         USER_ID: CUR_USERID,
//       };

//       apiBaseHelper.postAPICall(getAddressApi, parameter).then((getdata) {
//         bool error = getdata['error'];

//         if (!error) {
//           var data = getdata['data'];

//           addressList =
//               (data as List).map((data) => User.fromAddress(data)).toList();

//           if (addressList.length == 1) {
//             selectedAddress = 0;
//             selAddress = addressList[0].id;
//             if (!ISFLAT_DEL) {
//               if (totalPrice < double.parse(addressList[0].freeAmt!)) {
//                 delCharge = double.parse(addressList[0].deliveryCharge!);
//               } else {
//                 delCharge = 0;
//               }
//             }
//           } else {
//             for (int i = 0; i < addressList.length; i++) {
//               if (addressList[i].isDefault == '1') {
//                 selectedAddress = i;
//                 selAddress = addressList[i].id;
//                 if (!ISFLAT_DEL) {
//                   if (totalPrice < double.parse(addressList[i].freeAmt!)) {
//                     delCharge = double.parse(addressList[i].deliveryCharge!);
//                   } else {
//                     delCharge = 0;
//                   }
//                 }
//               }
//             }
//           }

//           if (ISFLAT_DEL) {
//             if ((oriPrice) < double.parse(MIN_AMT!)) {
//               delCharge = double.parse(CUR_DEL_CHR!);
//             } else {
//               delCharge = 0;
//             }
//           }
//           totalPrice = totalPrice + delCharge;
//         } else {
//           if (ISFLAT_DEL) {
//             if ((oriPrice) < double.parse(MIN_AMT!)) {
//               delCharge = double.parse(CUR_DEL_CHR!);
//             } else {
//               delCharge = 0;
//             }
//           }
//           totalPrice = totalPrice + delCharge;
//         }
//         if (mounted) {
//           setState(() {
//             _isLoading = false;
//           });
//         }

//         if (checkoutState != null) checkoutState!(() {});
//       }, onError: (error) {
//         setSnackbar(error.toString(), context);
//       });
//     } on TimeoutException catch (_) {}
//   } else {
//     if (mounted) {
//       setState(() {
//         _isNetworkAvail = false;
//       });
//     }
//   }
// }
}

class ListItem extends StatefulWidget {
  final double imageSize;
  final SectionModel sectionModel;

  final ValueChanged<SectionModel> onChanged;
  final VoidCallback updateList;

  ListItem(this.imageSize, this.sectionModel, this.onChanged, this.updateList);

  @override
  RoomEditDeleteItemState createState() => RoomEditDeleteItemState(
      this.imageSize, this.sectionModel, this.onChanged, this.updateList);
}

class RoomEditDeleteItemState extends State<ListItem> {
  double imageSize;
  final ValueChanged<SectionModel> onChanged;
  final VoidCallback updateList;
  SectionModel sectionModel;
  double radius = 7;

  RoomEditDeleteItemState(
      this.imageSize, this.sectionModel, this.onChanged, this.updateList);

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
                            image: NetworkImage(
                                sectionModel.productList![0].image!),
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
                                sectionModel.productList![0].name ?? "",
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
                                        INDIAN_RS_SYM +
                                            sectionModel.singleItemNetAmount!
                                                .toString(),
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
                                                  // if (int.parse(
                                                  //         sectionModel.qty!) >
                                                  //     1) {
                                                  updateCart(
                                                      sectionModel.varientId!,
                                                      int.parse(sectionModel
                                                              .qty!) -
                                                          1);

                                                  print(
                                                      "Product var id ${sectionModel.varientId!}");
                                                  // }
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: getCustomTextWithoutAlign(
                                                    sectionModel.qty.toString(),
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
                                                  // sectionModel.quantity++;
                                                  // setState(() {});
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
              widget.onChanged(sectionModel);
            },
          )
        ],
      ),
    ));
  }

  void updateCart(String productId, int qty) {
    var parameter = {
      USER_ID: CUR_USERID,
      PRODUCT_VARIENT_ID: productId,
      QTY: qty.toString(),
    };
    apiBaseHelper.postAPICall(manageCartApi, parameter).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var data = getdata['data'];
          print("Data added to cart $msg");
          // widget.model!.prVarientList![_oldSelVarient].cartCount =
          //     qty.toString();
          context.read<UserProvider>().setCartCount(data['cart_count']);
          var cart = getdata['cart'];
          List<SectionModel> cartList = [];
          cartList = (cart as List)
              .map((cart) => SectionModel.fromCart(cart))
              .toList();
          context.read<CartProvider>().setCartlist(cartList);
        } else {
          setSnackbar(msg!, context);
        }
      },
      onError: (error) async {
        if (error.toString() == "Invalid number") {}
        setSnackbar(error.toString(), context);
      },
    ).then((value) => updateList());
  }
}
