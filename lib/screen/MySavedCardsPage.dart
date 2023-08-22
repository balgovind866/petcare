import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/CardModel.dart';

import 'AddNewCardPage.dart';

class MySavedCardsPage extends StatefulWidget {
  @override
  _MySavedCardsPage createState() {
    return _MySavedCardsPage();
  }
}

class _MySavedCardsPage extends State<MySavedCardsPage> {
  List<CardModel> cardList = DataFile.getCardList();

  int _selectedCards = 0;

  @override
  void initState() {
    super.initState();
    cardList = DataFile.getCardList();
    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ConstantColors.bgColor,
            title: getCustomText(S.of(context).mySavedCards, textColor, 1,
                TextAlign.center, FontWeight.bold, 18),
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
            child: Container(
              margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                  bottom: MediaQuery.of(context).size.width * 0.01),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   S.of(context).savedCards,
                      //   textAlign: TextAlign.start,
                      //   style: TextStyle(
                      //       fontFamily: "SFProText",
                      //       fontWeight: FontWeight.w800,
                      //       fontSize: 15,
                      //       color: textColor),
                      // ),

                      Row(
                        children: [
                          getCustomText(S.of(context).saveCards, textColor, 1,
                              TextAlign.start, FontWeight.w800, 15),
                          new Spacer(),
                          InkWell(
                            child: getCustomText(
                                S.of(context).newCard.toUpperCase(),
                                textColor,
                                1,
                                TextAlign.start,
                                FontWeight.w600,
                                12),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddNewCardPage()));
                            },
                          )
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: cardList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                padding: EdgeInsets.all(8),
                                decoration: new BoxDecoration(
                                    color: cardColor,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey.shade200,
                                    //     blurRadius: 10,
                                    //   )
                                    // ],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                            child: Icon(
                                              CupertinoIcons
                                                  .checkmark_alt_circle_fill,
                                              color: (_selectedCards == index)
                                                  ? accentColors
                                                  : Colors.grey.shade400,
                                              size: 25,
                                            ),
                                            onTap: () {
                                              _selectedCards = index;
                                              setState(() {});
                                            }),
                                        Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: getCustomText(
                                                "XXXX XXXX XXXX 1234",
                                                textColor,
                                                1,
                                                TextAlign.start,
                                                FontWeight.w700,
                                                14)),
                                        new Spacer(),
                                        Image.asset(
                                          Constants.assetsImagePath+cardList[index].image!,
                                          width: 25,
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Constants.assetsImagePath +
                                                "credit_card.png",
                                            width: 30,
                                            height: 20,
                                            color: accentColors,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: getCustomText(
                                                  S.of(context).validFrom.toUpperCase(),
                                                  textColor,
                                                  1,
                                                  TextAlign.start,
                                                  FontWeight.bold,
                                                  10)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: getCustomText(
                                                cardList[index].expDate??"",
                                                textColor,
                                                1,
                                                TextAlign.start,
                                                FontWeight.bold,
                                                10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 2),
                                      child: Row(
                                        children: [
                                          getCustomText(
                                              cardList[index]
                                                  .name!.toUpperCase(),
                                              textColor,
                                              1,
                                              TextAlign.start,
                                              FontWeight.w500,
                                              12),
                                          new Spacer(),
                                          getCustomText(
                                              S.of(context).cvv,
                                              textColor,
                                              1,
                                              TextAlign.start,
                                              FontWeight.w500,
                                              14),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                left: 8,
                                                bottom: 5,
                                                right: 8),
                                            margin: EdgeInsets.only(left: 5),
                                            decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Center(
                                              child: getCustomText(
                                                  "789",
                                                  Colors.white,
                                                  1,
                                                  TextAlign.start,
                                                  FontWeight.w800,
                                                  8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {},
                            );
                          })
                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: cardList.length,
                      //     itemBuilder: (context, index) {
                      //       return InkWell(
                      //         child: Container(
                      //           margin: EdgeInsets.only(top: 10, bottom: 10),
                      //           padding: EdgeInsets.all(12),
                      //           decoration: new BoxDecoration(
                      //               color: whiteColor,
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                   color: Colors.black12,
                      //                   offset: Offset(1, 1),
                      //                   blurRadius: 1,
                      //                 )
                      //               ],
                      //               borderRadius: BorderRadius.all(
                      //                   Radius.circular(10.0))),
                      //           child: Column(
                      //             children: [
                      //               Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.start,
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.center,
                      //                 children: [
                      //                   Column(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.start,
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       getCustomText(
                      //                           cardList[index].name,
                      //                           textColor,
                      //                           1,
                      //                           TextAlign.start,
                      //                           FontWeight.w700,
                      //                           12),
                      //                       Padding(
                      //                         padding: EdgeInsets.only(top: 2),
                      //                         child: getCustomText(
                      //                             cardList[index].email,
                      //                             primaryTextColor,
                      //                             1,
                      //                             TextAlign.start,
                      //                             FontWeight.w500,
                      //                             10),
                      //                       )
                      //                     ],
                      //                   ),
                      //                   new Spacer(),
                      //                   Align(
                      //                     alignment: Alignment.centerRight,
                      //                     child: Padding(
                      //                       padding: EdgeInsets.only(right: 3),
                      //                       child: Row(
                      //                         children: [
                      //                           Image.asset(
                      //                               Constants.assetsImagePath+cardList[index].image,
                      //                               height: 35,
                      //                               width: 35),
                      //                           Padding(
                      //                             padding:
                      //                                 EdgeInsets.only(left: 5),
                      //                             child: InkWell(
                      //                               child: Icon(
                      //                                 (_selectedCards == index)
                      //                                     ? Icons
                      //                                         .radio_button_checked
                      //                                     : Icons
                      //                                         .radio_button_unchecked,
                      //                                 color: (_selectedCards ==
                      //                                         index)
                      //                                     ? textColor
                      //                                     : disableIconColor,
                      //                                 size: 20,
                      //                               ),
                      //                               onTap: () {
                      //                                 _selectedCards = index;
                      //                                 setState(() {});
                      //                               },
                      //                             ),
                      //                           )
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   )
                      //                 ],
                      //               ),
                      //               Padding(
                      //                 padding:
                      //                     EdgeInsets.only(top: 15, bottom: 5),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.start,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.center,
                      //                   children: [
                      //                     getCustomText(
                      //                         S.of(context).cardNo,
                      //                         primaryTextColor,
                      //                         1,
                      //                         TextAlign.start,
                      //                         FontWeight.w500,
                      //                         10),
                      //                     Padding(
                      //                       padding: EdgeInsets.only(
                      //                           left: 40, right: 30),
                      //                       child: getCustomText(
                      //                           ":",
                      //                           primaryTextColor,
                      //                           1,
                      //                           TextAlign.start,
                      //                           FontWeight.w500,
                      //                           10),
                      //                     ),
                      //                     Expanded(
                      //                       child: getCustomText(
                      //                           cardList[index].cardNo,
                      //                           textColor,
                      //                           1,
                      //                           TextAlign.end,
                      //                           FontWeight.w900,
                      //                           10),
                      //                       flex: 1,
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: EdgeInsets.only(bottom: 5),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.start,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.center,
                      //                   children: [
                      //                     Expanded(
                      //                       child: Row(
                      //                         children: [
                      //                           getCustomText(
                      //                               S.of(context).expDate,
                      //                               primaryTextColor,
                      //                               1,
                      //                               TextAlign.start,
                      //                               FontWeight.w500,
                      //                               10),
                      //                           Padding(
                      //                             padding: EdgeInsets.only(
                      //                                 left: 20, right: 20),
                      //                             child: getCustomText(
                      //                                 ":",
                      //                                 primaryTextColor,
                      //                                 1,
                      //                                 TextAlign.start,
                      //                                 FontWeight.w500,
                      //                                 10),
                      //                           ),
                      //                           Expanded(
                      //                             child: getCustomText(
                      //                                 cardList[index].expDate,
                      //                                 textColor,
                      //                                 1,
                      //                                 TextAlign.end,
                      //                                 FontWeight.w900,
                      //                                 10),
                      //                             flex: 1,
                      //                           )
                      //                         ],
                      //                       ),
                      //                       flex: 1,
                      //                     ),
                      //                     Expanded(
                      //                       child: Row(
                      //                         children: [
                      //                           Padding(
                      //                             padding:
                      //                                 EdgeInsets.only(left: 15),
                      //                             child: getCustomText(
                      //                                 S.of(context).cvv,
                      //                                 primaryTextColor,
                      //                                 1,
                      //                                 TextAlign.start,
                      //                                 FontWeight.w500,
                      //                                 10),
                      //                           ),
                      //                           Padding(
                      //                             padding: EdgeInsets.only(
                      //                                 left: 20, right: 20),
                      //                             child: getCustomText(
                      //                                 ":",
                      //                                 primaryTextColor,
                      //                                 1,
                      //                                 TextAlign.start,
                      //                                 FontWeight.w500,
                      //                                 10),
                      //                           ),
                      //                           Expanded(
                      //                             child: getCustomText(
                      //                                 cardList[index].cVV,
                      //                                 textColor,
                      //                                 1,
                      //                                 TextAlign.end,
                      //                                 FontWeight.w900,
                      //                                 10),
                      //                             flex: 1,
                      //                           )
                      //                         ],
                      //                       ),
                      //                       flex: 1,
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         onTap: () {},
                      //       );
                      //     })
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
        onWillPop: _requestPop);
  }
}
