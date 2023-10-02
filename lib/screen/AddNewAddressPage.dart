import 'package:flutter/material.dart';
import 'package:petcare/HomeScreen.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/helper/String.dart';
import 'package:petcare/model/User.dart';

class AddNewAddressPage extends StatefulWidget {
  @override
  _AddNewAddressPage createState() {
    return _AddNewAddressPage();
  }
}

class _AddNewAddressPage extends State<AddNewAddressPage> {
  int _selectedRadio = 0;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getCityCodes();
    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  List<User> cityList = [];
  List<User> areaList = [];
  String selectedCityId = "";
  String selectedAreaId = "";
  String name = "",
      mobile = "",
      city = "",
      pincode = "",
      address = "",
      type = "";
  TextEditingController _textEditingControllerName =
      TextEditingController(text: "");
  TextEditingController _textEditingControllerMobile =
      TextEditingController(text: "");
  TextEditingController _textEditingControllerCity =
      TextEditingController(text: "");
  TextEditingController _textEditingControllerPincode =
      TextEditingController(text: "");
  TextEditingController _textEditingControllerAddress =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double leftMargin = MediaQuery.of(context).size.width * 0.04;
    double editTextHeight = MediaQuery.of(context).size.height * 0.08;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ConstantColors.bgColor,
            title: getCustomText(S.of(context).address, textColor, 1,
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
            margin: EdgeInsets.only(
                left: leftMargin, right: leftMargin, top: leftMargin),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // ReviewSlider(
                        //     optionStyle: TextStyle(
                        //       fontFamily: Constants.fontsFamily,
                        //       fontSize: 8,
                        //       color: textColor,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //     onChange: (index) {},
                        //     initialValue: 0,
                        //     width: double.infinity,
                        //     options: [
                        //       S.of(context).personalInfo,
                        //       S.of(context).payment,
                        //       S.of(context).confirmation
                        //     ]),
                        Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: getCustomText(
                                  S.of(context).deliverTo,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.bold,
                                  16)),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: getCustomText(
                                  S.of(context).fullName,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.bold,
                                  12),
                            )),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: editTextHeight,
                          child: TextFormField(
                            maxLines: 1,
                            controller: _textEditingControllerName,
                            style: TextStyle(
                                fontFamily: Constants.fontsFamily,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 3, left: 8),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: textColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: disableIconColor),
                              ),
                            ),
                            validator: (value) {
                              print("hello3");
                              if (value == null || value.isEmpty) {
                                print("hello4");
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: getCustomText(
                                  S.of(context).phoneNumber,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.bold,
                                  12)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: editTextHeight,
                          child: TextFormField(
                            maxLines: 1,
                            controller: _textEditingControllerMobile,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontFamily: Constants.fontsFamily,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 3, left: 8),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: textColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: disableIconColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      S.of(context).cityarea,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: Constants.fontsFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: textColor),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      child: DropdownButtonFormField<String?>(
                                        //     0.4,
                                        hint: Text("Select City"),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedCityId = value ?? "";
                                            selectedAreaId = "";
                                            areaList.clear();
                                          });
                                          getAreas();
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Select City';
                                          }
                                          return null;
                                        },
                                        items: cityList
                                            .map((e) =>
                                                DropdownMenuItem<String?>(
                                                    value: e.id,
                                                    child: Text(e.name ?? "")))
                                            .toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      child: DropdownButtonFormField<String?>(
                                        // enabled: areaList.isNotEmpty,
                                        hint: Text("Select Area"),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedAreaId = value ?? "";
                                            _textEditingControllerPincode.text =
                                                areaList
                                                    .firstWhere((element) =>
                                                        element.id ==
                                                        selectedAreaId)
                                                    .pincode
                                                    .toString();
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Select Area';
                                          }
                                          return null;
                                        },
                                        items: areaList
                                            .map((e) =>
                                                DropdownMenuItem<String?>(
                                                    value: e.id,
                                                    child: Text(e.name ?? "")))
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          flex: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 8),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: getCustomText(S.of(context).zip, textColor,
                                  1, TextAlign.start, FontWeight.bold, 12)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 8),
                          height: editTextHeight,
                          child: TextFormField(
                            maxLines: 1,
                            controller: _textEditingControllerPincode,
                            style: TextStyle(
                                fontFamily: Constants.fontsFamily,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 3, left: 8),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: textColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: disableIconColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: getCustomText(
                                  S.of(context).address,
                                  textColor,
                                  1,
                                  TextAlign.start,
                                  FontWeight.bold,
                                  12)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: editTextHeight,
                          child: TextFormField(
                            maxLines: 1,
                            controller: _textEditingControllerAddress,
                            style: TextStyle(
                                fontFamily: Constants.fontsFamily,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 3, left: 8),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: textColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: disableIconColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: _radioView(S.of(context).houseapartment,
                              (_selectedRadio == 0), 0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: _radioView(S.of(context).agencycompany,
                              (_selectedRadio == 1), 1),
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: leftMargin),
                      height: 50,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: InkWell(
                        child: Center(
                          child: getCustomText(S.of(context).save, Colors.white,
                              1, TextAlign.start, FontWeight.w900, 15),
                        ),
                      )),
                  onTap: () {
                    print("hello");
                    if (_formkey.currentState!.validate()) {
                      print("hello1");
                      addAddressData();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: _requestPop);
  }

  Widget _radioView(String s, bool isSelected, int position) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: isSelected ? textColor : disableIconColor,
            size: 18,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: getCustomText(
                s, textColor, 1, TextAlign.start, FontWeight.bold, 12),
          )
        ],
      ),
      onTap: () {
        if (position != _selectedRadio) {
          if (_selectedRadio == 0) {
            _selectedRadio = 1;
          } else {
            _selectedRadio = 0;
          }
        }
        setState(() {});
      },
    );
  }

  void getCityCodes() async {
    apiBaseHelper.postAPICall(getCitiesApi, {}).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var data = getdata['data'];
          cityList = (data as List).map((data) => User.fromJson(data)).toList();
          print("citylist ${cityList[0].name}");
          setState(() {});
        } else {
          setSnackbar(msg!, context);
        }
      },
      onError: (error) {
        setSnackbar(error.toString(), context);
      },
    );
  }

  void getAreas() async {
    apiBaseHelper.postAPICall(getAreaByCityApi, {"id": selectedCityId}).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          var data = getdata['data'];
          areaList = (data as List).map((data) => User.fromJson(data)).toList();
          print("citylist ${areaList[0].name}");
          setState(() {});
        } else {
          setSnackbar(msg!, context);
        }
      },
      onError: (error) {
        setSnackbar(error.toString(), context);
      },
    );
  }

  Future<void> addAddressData() async {
    Map parameter = {
      "user_id": CUR_USERID,
      "name": _textEditingControllerName.text,
      "type": _selectedRadio == 0 ? "Home" : "Office",
      "mobile": _textEditingControllerMobile.text,
      "address": _textEditingControllerAddress.text,
      "area_id": selectedAreaId,
      "city_id": selectedCityId,
      "pincode": _textEditingControllerPincode.text,
      "country_code": "91",
      "state": "Maharashtra",
      "country": "India",
      "is_default": "1",
      "area":
          areaList.firstWhere((element) => element.id == selectedAreaId).name,
      "city":
          cityList.firstWhere((element) => element.id == selectedCityId).name
    };
    print("USER_ID: {CUR_USERID}");
    print("parameter2 : $parameter");
    apiBaseHelper.postAPICall(getAddAddressApi, parameter).then(
      (getdata) {
        bool error = getdata['error'];
        String? msg = getdata['message'];
        if (!error) {
          // var data = getdata
          setSnackbar("Successfully Added Address", context);
          Navigator.of(context).pop(true);
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
