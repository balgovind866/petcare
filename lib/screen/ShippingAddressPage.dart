import 'package:flutter/material.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/helper/String.dart';

import '../model/User.dart';
import 'AddNewAddressPage.dart';

class ShippingAddressPage extends StatefulWidget {
  @override
  _ShippingAddressPage createState() {
    return _ShippingAddressPage();
  }
}

class _ShippingAddressPage extends State<ShippingAddressPage> {
  List addressList = [];
  int _selectedAddress = 0;

  @override
  void initState() {
    super.initState();
    getAddress();
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
            title: getCustomText(S.of(context).shippingAddress, textColor, 1,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   S.of(context).addressTitle,
                  //   textAlign: TextAlign.start,
                  //   style: TextStyle(
                  //       fontFamily: "SFProText",
                  //       fontWeight: FontWeight.w800,
                  //       fontSize: 15,
                  //       color: textColor),
                  // ),

                  Row(
                    children: [
                      getCustomText(S.of(context).addressTitle, textColor, 1,
                          TextAlign.start, FontWeight.w800, 15),
                      new Spacer(),
                      InkWell(
                        child: getCustomText(S.of(context).newAddress,
                            textColor, 1, TextAlign.start, FontWeight.w600, 12),
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNewAddressPage()));
                          getAddress();
                        },
                      )
                    ],
                  ),

                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: addressList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            padding: EdgeInsets.all(15),
                            decoration: new BoxDecoration(
                                color: cardColor,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black12,
                                //     offset: Offset(1, 1),
                                //     blurRadius: 1,
                                //   )
                                // ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    getCustomText(
                                        addressList[index].name ?? "",
                                        textColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w900,
                                        12),
                                    new Spacer(),
                                    Icon(
                                      (_selectedAddress == index)
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                      color: (_selectedAddress == index)
                                          ? textColor
                                          : disableIconColor,
                                      size: 20,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: getCustomText(
                                      addressList[index].address ?? "",
                                      primaryTextColor,
                                      1,
                                      TextAlign.start,
                                      FontWeight.w500,
                                      12),
                                ),
                                getCustomText(
                                    "${addressList[index].area} ${addressList[index].city}",
                                    primaryTextColor,
                                    1,
                                    TextAlign.start,
                                    FontWeight.w500,
                                    10),
                              ],
                            ),
                          ),
                          onTap: () {
                            _selectedAddress = index;
                            setState(() {});
                          },
                        );
                      })
                ],
              ),
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  Future<void> getAddress() async {
    Map parameter = {
      USER_ID: CUR_USERID,
    };
    // print("USER_ID: {CUR_USERID}");
    apiBaseHelper.postAPICall(getAddressApi, parameter).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var data = getdata['data'];
          addressList =
              (data as List).map((data) => User.fromAddress(data)).toList();
          setState(() {});
          setSnackbar(msg!, context);
        } else {
          setSnackbar(msg!, context);
        }
      },
      onError: (error) {
        setSnackbar(error.toString(), context);
      },
    );
  }
}
