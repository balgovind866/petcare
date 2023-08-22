// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyOrderPage extends StatefulWidget {
//   @override
//   _MyOrderPage createState() {
//     return _MyOrderPage();
//   }
// }
//
// class _MyOrderPage extends State<MyOrderPage>
//     with SingleTickerProviderStateMixin {
//   List<SubCategoryModel> myOrderList = DataFile.getMyOrderList();
//
//   List<OrderDescModel> orderList = DataFile.getOrderDescList();
//   List<OrderModel> allOrderList = DataFile.getOrderList();
//   TabController _controller;
//
//   int expandPosition = -1;
//
//   List<Widget> list = [
//     Tab(
//         icon: Icon(
//       Icons.card_travel,
//       color: Colors.transparent,
//     )),
//     Tab(
//         icon: Icon(
//       Icons.card_travel,
//       color: Colors.transparent,
//     )),
//     Tab(
//         icon: Icon(
//       Icons.add_shopping_cart,
//       color: Colors.transparent,
//     )),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = TabController(length: list.length, vsync: this);
//
//     _controller.addListener(() {
//       setState(() {});
//       print("Selected Index: " + _controller.index.toString());
//     });
//     setState(() {});
//   }
//
//   Future<bool> _requestPop() {
//     Navigator.of(context).pop();
//     return new Future.value(true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return WillPopScope(
//         child: Scaffold(
//           backgroundColor: ConstantColors.bgColor,
//           appBar: AppBar(
//             elevation: 0,
//             centerTitle: true,
//             backgroundColor: ConstantColors.bgColor,
//             // title: Text(S.of(context).myOrderHistory,
//             //     textAlign: TextAlign.center,
//             //     style: TextStyle(
//             //         fontWeight: FontWeight.bold,
//             //         fontSize: font18Px,
//             //         fontFamily: fontFamily,
//             //         color: textColor)),
//
//             title: getCustomText(S.of(context).myOrderHistory, textColor, 1,
//                 TextAlign.start, FontWeight.bold, 18),
//             leading: Builder(
//               builder: (BuildContext context) {
//                 return IconButton(
//                   icon: Icon(
//                     Icons.arrow_back_ios_sharp,
//                     color: textColor,
//                   ),
//                   onPressed: _requestPop,
//                 );
//               },
//             ),
//             bottom: TabBar(
//               indicatorColor: primaryColor,
//               indicatorWeight: 3,
//               unselectedLabelColor: textColor,
//               labelColor: primaryColor,
//               labelStyle: TextStyle(
//                 fontFamily: Constants.fontsFamily,
//                 fontWeight: FontWeight.w800,
//                 fontSize: 16,
//               ),
//               unselectedLabelStyle: TextStyle(
//                 fontFamily: Constants.fontsFamily,
//                 fontWeight: FontWeight.w200,
//                 fontSize: 16,
//               ),
//               controller: _controller,
//               tabs: [
//                 Tab(
//                   text: S.of(context).all,
//                 ),
//                 Tab(
//                   text: S.of(context).onDelivery,
//                 ),
//                 Tab(text: S.of(context).history),
//               ],
//             ),
//           ),
//           body: Container(
//             child: TabBarView(
//               controller: _controller,
//               children: [allOrder(), onDelivery(), onCompleted()],
//             ),
//           ),
//         ),
//         onWillPop: _requestPop);
//   }
//
//   Widget onCompleted() {
//     double leftMargin = MediaQuery.of(context).size.width * 0.05;
//     // double imageSize = SizeConfig.safeBlockVertical * 8;
//     // double imageHeight = SizeConfig.safeBlockVertical * 7;
//
//     double cellHeight =
//         Constants.getPercentSize(SizeConfig.safeBlockHorizontal * 100, 35);
//     double imageSize = Constants.getPercentSize(cellHeight, 45);
//     double bottomSize = cellHeight - imageSize;
//     double bottomButtonSize = Constants.getPercentSize(bottomSize, 60);
//
//     return Container(
//         child: ListView.builder(
//             shrinkWrap: true,
//             padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: myOrderList.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 child: Container(
//                   padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2.5),
//                   width: double.infinity,
//                   height: cellHeight,
//                   decoration: BoxDecoration(
//                       color: cardColor,
//                       borderRadius: BorderRadius.circular(7),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade200,
//                           blurRadius: 5,
//                         )
//                       ]),
//                   margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(7),
//                             ),
//                             child: Image.asset(
//                               Constants.assetsImagePath +
//                                   myOrderList[index].image,
//                               fit: BoxFit.cover,
//                               width: imageSize,
//                               height: imageSize,
//                             ),
//                           ),
//                           getHorizonSpace(SizeConfig.safeBlockHorizontal * 2),
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 getCustomText(
//                                     S.of(context).orderId + " : #2CE5DW",
//                                     textColor,
//                                     1,
//                                     TextAlign.start,
//                                     FontWeight.bold,
//                                     Constants.getPercentSize(imageSize, 23)),
//                                 Padding(
//                                   padding: EdgeInsets.only(top: 5),
//                                   child: getCustomText(
//                                       "3 " + S.of(context).items,
//                                       textColor,
//                                       1,
//                                       TextAlign.start,
//                                       FontWeight.w500,
//                                       Constants.getPercentSize(imageSize, 18)),
//                                 ),
//                               ],
//                             ),
//                             flex: 1,
//                           )
//                         ],
//                       ),
//
//                       Padding(
//                         padding: EdgeInsets.only(top: 0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: InkWell(
//                                 child: Container(
//                                   height: bottomButtonSize,
//                                   margin: EdgeInsets.only(right: 15),
//                                   decoration: BoxDecoration(
//                                       color: Colors.transparent,
//                                       shape: BoxShape.rectangle,
//                                       borderRadius: BorderRadius.circular(10),
//                                       border: Border.all(
//                                           width: 0.5,
//                                           color: Colors.grey.shade400)),
//                                   child: Center(
//                                     child: getCustomTextWithoutAlign(
//                                         S.of(context).orderDetails,
//                                         textColor,
//                                         FontWeight.w700,
//                                         14),
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               OrderDetailPage()));
//                                 },
//                               ),
//                               flex: 1,
//                             ),
//                             Expanded(
//                               child: InkWell(
//                                 child: Container(
//                                   height: bottomButtonSize,
//                                   margin: EdgeInsets.only(left: 15),
//                                   decoration: BoxDecoration(
//                                     color: primaryColor,
//                                     shape: BoxShape.rectangle,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(
//                                     child: getCustomTextWithoutAlign(
//                                         S.of(context).reorder,
//                                         Colors.white,
//                                         FontWeight.w700,
//                                         14),
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   // Navigator.push(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //       builder: (context) => ProductDetailPage(
//                                   //           myOrderList[index]),
//                                   //     ));
//                                 },
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       )
//
//                       //   ],
//                       // )
//                     ],
//                   ),
//                 ),
//                 onTap: () {},
//               );
//             }));
//   }
//
//   Widget onDelivery() {
//     double leftMargin = MediaQuery.of(context).size.width * 0.05;
//     double cellHeight =
//         Constants.getPercentSize(SizeConfig.safeBlockHorizontal * 100, 35);
//     double imageSize = Constants.getPercentSize(cellHeight, 45);
//     double bottomSize = cellHeight - imageSize;
//     double bottomButtonSize = Constants.getPercentSize(bottomSize, 60);
//
//     return Container(
//         child: ListView.builder(
//             shrinkWrap: true,
//             padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: myOrderList.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 child: Container(
//                   padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2.5),
//                   width: double.infinity,
//                   height: cellHeight,
//                   decoration: BoxDecoration(
//                       color: cardColor,
//                       borderRadius: BorderRadius.circular(7),
//                       // boxShadow: [
//                       //   BoxShadow(
//                       //     color: Colors.grey.shade200,
//                       //     blurRadius: 5,
//                       //   )
//                       // ]
//                   ),
//                   margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(7),
//                             ),
//                             child: Image.asset(
//                               Constants.assetsImagePath +
//                                   myOrderList[index].image,
//                               fit: BoxFit.cover,
//                               width: imageSize,
//                               height: imageSize,
//                             ),
//                           ),
//                           getHorizonSpace(SizeConfig.safeBlockHorizontal * 2),
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 getCustomText(
//                                     S.of(context).orderId + " : #2CE5DW",
//                                     textColor,
//                                     1,
//                                     TextAlign.start,
//                                     FontWeight.bold,
//                                     Constants.getPercentSize(imageSize, 23)),
//                                 Padding(
//                                   padding: EdgeInsets.only(top: 5),
//                                   child: getCustomText(
//                                       "3 " + S.of(context).items,
//                                       textColor,
//                                       1,
//                                       TextAlign.start,
//                                       FontWeight.w500,
//                                       Constants.getPercentSize(imageSize, 18)),
//                                 ),
//                               ],
//                             ),
//                             flex: 1,
//                           )
//                         ],
//                       ),
//
//                       Padding(
//                         padding: EdgeInsets.only(top: 0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: InkWell(
//                                 child: Container(
//                                   height: bottomButtonSize,
//                                   margin: EdgeInsets.only(right: 15),
//                                   decoration: BoxDecoration(
//                                       color: Colors.transparent,
//                                       shape: BoxShape.rectangle,
//                                       borderRadius: BorderRadius.circular(10),
//                                       border: Border.all(
//                                           width: 0.5,
//                                           color: Colors.grey.shade400)),
//                                   child: Center(
//                                     child: getCustomTextWithoutAlign(
//                                         S.of(context).cancelOrder,
//                                         textColor,
//                                         FontWeight.w700,
//                                         14),
//                                   ),
//                                 ),
//                                 onTap: () {},
//                               ),
//                               flex: 1,
//                             ),
//                             Expanded(
//                               child: InkWell(
//                                 child: Container(
//                                   height: bottomButtonSize,
//                                   margin: EdgeInsets.only(left: 15),
//                                   decoration: BoxDecoration(
//                                     color: primaryColor,
//                                     shape: BoxShape.rectangle,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(
//                                     child: getCustomTextWithoutAlign(
//                                         S.of(context).trackOrder,
//                                         Colors.white,
//                                         FontWeight.w700,
//                                         14),
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         // builder: (context) => PlacePolylineBody(),
//                                         builder: (context) => OrderTrackMap(),
//                                       ));
//                                 },
//                               ),
//                               flex: 1,
//                             ),
//                           ],
//                         ),
//                       )
//
//                       //   ],
//                       // )
//                     ],
//                   ),
//                 ),
//                 onTap: () {
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => OrderDetailPage()));
//                 },
//               );
//             }));
//   }
//
//   Widget allOrder() {
//     double imageSize = SizeConfig.safeBlockVertical * 6;
//
//     return Container(
//         child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: allOrderList.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 15, right: 15),
//                         child: InkWell(
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: imageSize,
//                                 width: imageSize,
//                                 margin: EdgeInsets.all(15),
//                                 padding: EdgeInsets.all(5),
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.rectangle,
//                                   color: Constants.getOrderColor(
//                                       allOrderList[index].type),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10),
//                                   ),
//                                 ),
//                                 child: Icon(
//                                   CupertinoIcons.rectangle_dock,
//                                   color: Constants.getIconColor(
//                                       allOrderList[index].type),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(bottom: 5),
//                                       child: getCustomText(
//                                           S.of(context).orderId +
//                                               " " +
//                                               allOrderList[index].orderId,
//                                           textColor,
//                                           1,
//                                           TextAlign.start,
//                                           FontWeight.w800,
//                                           15),
//                                     ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         getCustomText(
//                                             allOrderList[index].items,
//                                             primaryTextColor,
//                                             1,
//                                             TextAlign.start,
//                                             FontWeight.w500,
//                                             15),
//                                         Container(
//                                           height: 8,
//                                           width: 8,
//                                           margin: EdgeInsets.only(
//                                               left: 15, right: 15),
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: primaryTextColor),
//                                         ),
//                                         getCustomText(
//                                             allOrderList[index].type,
//                                             primaryTextColor,
//                                             1,
//                                             TextAlign.start,
//                                             FontWeight.w500,
//                                             12),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 flex: 1,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 10, right: 10),
//                                 child: Icon(
//                                   (index == expandPosition)
//                                       ? CupertinoIcons.chevron_up
//                                       : CupertinoIcons.chevron_down,
//                                   color: primaryTextColor,
//                                 ),
//                               )
//                             ],
//                           ),
//                           onTap: () {
//                             if (expandPosition == index) {
//                               expandPosition = -1;
//                             } else {
//                               expandPosition = index;
//                             }
//
//                             setState(() {});
//                           },
//                         ),
//                       ),
//                       Visibility(
//                         child: Container(
//                           child: ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: orderList.length,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   child: Container(
//                                     margin:
//                                         EdgeInsets.only(top: 10, bottom: 15),
//                                     child: Container(
//                                       margin:
//                                           EdgeInsets.only(left: 30, right: 30),
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             height: 15,
//                                             width: 15,
//                                             margin: EdgeInsets.only(
//                                                 right: 15, top: 3),
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color:
//                                                   (orderList[index].completed ==
//                                                           1)
//                                                       ? primaryColor
//                                                       : iconColor,
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Padding(
//                                                   padding: EdgeInsets.only(
//                                                       bottom: 5),
//                                                   child: getCustomText(
//                                                       S.of(context).orderId +
//                                                           " " +
//                                                           orderList[index].name,
//                                                       textColor,
//                                                       1,
//                                                       TextAlign.start,
//                                                       FontWeight.w800,
//                                                       15),
//                                                 ),
//                                                 Row(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.center,
//                                                   children: [
//                                                     getCustomText(
//                                                         orderList[index].desc,
//                                                         primaryTextColor,
//                                                         1,
//                                                         TextAlign.start,
//                                                         FontWeight.w500,
//                                                         12),
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                             flex: 1,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   onTap: () {},
//                                 );
//                               }),
//                         ),
//                         visible: (index == expandPosition),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 10, bottom: 10),
//                         color: subTextColor,
//                         height: 0.5,
//                       )
//                     ],
//                   ),
//                 ),
//                 onTap: () {},
//               );
//             }));
//   }
// }
