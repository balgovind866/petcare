import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:petcare/Model/Section_Model.dart';
import 'package:petcare/Provider/ProductProvider.dart';
import 'package:petcare/Provider/SettingProvider.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/helper/ApiBaseHelper.dart';
import 'package:petcare/helper/Constant.dart';
import 'package:petcare/helper/Session.dart';
import 'package:petcare/screen/BookPetTreatment.dart';
import 'package:petcare/tab/TabHome.dart';
import 'package:petcare/tab/TabPets.dart';
import 'package:petcare/tab/TabProfile.dart';
import 'package:provider/provider.dart';

import 'helper/String.dart';
import 'screen/ShoppingPage.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  int pos;

  HomeScreen(this.pos);

  @override
  _HomeScreen createState() => _HomeScreen(pos);
}

class Destination {
  final String title;
  final IconData icon;

  const Destination(this.title, this.icon);
}

ApiBaseHelper apiBaseHelper = ApiBaseHelper();

class _HomeScreen extends State<HomeScreen> {
  int currentIndex = 0;
  int offset = 0;
  int total = 0;
  bool _isFirstLoad = true;
  String minPrice = '0', maxPrice = '0';
  String selId = '';
  RangeValues? _currentRangeValues;
  var filterList;
  List<String>? tagList = [];
  List<Product>? tempList = [];
  List<Product>? productList = [];
  bool isLoadingmore = true;
  bool _isLoading = true, _isProgress = false;

  _HomeScreen(this.currentIndex);

  static List<Widget> _widgetOptions = <Widget>[
    TabHome(),
    ShoppingPage(),
    // TabOrder(),
    TabPets(),
    BookPetTreatment(),
    TabProfile()
  ];
  List<Destination> allDestinations = [];

  requestPer() async {
    if (!(await Geolocator.checkPermission() == LocationPermission.whileInUse ||
        await Geolocator.checkPermission() == LocationPermission.always)) {
      Geolocator.requestPermission();
    }
  }

  @override
  void initState() {
    super.initState();
    requestPer();
    getProduct('0');
  }

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = context.watch<SettingProvider>();
    CUR_USERID = settingProvider.userId;
    print("Current user: ${settingProvider.email}");
    allDestinations = <Destination>[
      Destination(S.of(context).home, CupertinoIcons.home),
      Destination(S.of(context).shopping, CupertinoIcons.bag_fill),
      Destination(S.of(context).services, Icons.room_service),
      Destination(S.of(context).pets, Icons.pets_rounded),
      Destination(S.of(context).profile, Icons.person),
    ];
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          body: SafeArea(
            child: _widgetOptions[this.currentIndex],
          ),
          bottomNavigationBar:
              // Theme(
              //   data:Theme.of(context).copyWith(
              //     canvasColor: cardColor,
              //     backgroundColor: Colors.red,
              //     bottomNavigationBarTheme:BottomNavigationBarThemeData(
              //       backgroundColor: Colors.red,
              //       elevation: 10,
              //       selectedLabelStyle: TextStyle(
              //           color: Color(0xFFA67926), fontFamily: 'Montserrat', fontSize: 14.0),
              //       unselectedLabelStyle: TextStyle(
              //           color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0),
              //       selectedItemColor: Color(0xFFA67926),
              //       unselectedItemColor: Colors.grey[600],
              //       showUnselectedLabels: true,
              //     )
              //   ) ,
              //   child:
              BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: cardColor,
            // fixedColor: Colors.blue,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Colors.grey,
            // backgroundColor: Colors.blueAccent,
            // backgroundColor: Colors.blue,
            currentIndex: currentIndex,
            selectedLabelStyle: TextStyle(
                fontFamily: Constants.fontsFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12),
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: allDestinations.map((Destination destination) {
              return BottomNavigationBarItem(
                  icon: Icon(destination.icon),
                  backgroundColor: Colors.white,
                  label: destination.title);
            }).toList(),
          ),
          // ),
        ),
        onWillPop: () async {
          print("inmain===true");
          if (currentIndex != 0) {
            setState(() {
              currentIndex = 0;
            });
          } else {
            Future.delayed(const Duration(milliseconds: 100), () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            });
          }
          return false;
        });
  }

  void getAvailVarient() {
    for (int j = 0; j < tempList!.length; j++) {
      if (tempList![j].stockType == '2') {
        for (int i = 0; i < tempList![j].prVarientList!.length; i++) {
          if (tempList![j].prVarientList![i].availability == '1') {
            tempList![j].selVarient = i;

            break;
          }
        }
      }
    }
    productList!.addAll(tempList!);
    print("Product Data: ${productList![0].minPrice}");
    context.read<ProductProvider>().setProductList(productList);
  }

  void getProduct(String top) {
    Map parameter = {
      LIMIT: perPage.toString(),
      OFFSET: offset.toString(),
      TOP_RETAED: top,
    };
    if (selId != '') {
      parameter[ATTRIBUTE_VALUE_ID] = selId;
    }
    // if (widget.tag!) parameter[TAG] = widget.name!;
    // if (widget.fromSeller!) {
    //   parameter['seller_id'] = widget.id!;
    // } else {
    //   parameter[CATID] = widget.id ?? '';
    // }
    // if (CUR_USERID != null) parameter[USER_ID] = CUR_USERID!;

    // if (widget.dis != null) {
    //   parameter[DISCOUNT] = widget.dis.toString();
    // } else {
    //   parameter[SORT] = sortBy;
    //   parameter[ORDER] = orderBy;
    // }

    if (_currentRangeValues != null &&
        _currentRangeValues!.start.round().toString() != '0') {
      parameter[MINPRICE] = _currentRangeValues!.start.round().toString();
    }

    if (_currentRangeValues != null &&
        _currentRangeValues!.end.round().toString() != '0') {
      parameter[MAXPRICE] = _currentRangeValues!.end.round().toString();
    }

    apiBaseHelper.postAPICall(getProductApi, parameter).then((getdata) {
      bool error = getdata['error'];
      String? msg = getdata['message'];
      if (!error) {
        total = int.parse(getdata['total']);

        if (_isFirstLoad) {
          filterList = getdata['filters'];

          minPrice = getdata[MINPRICE].toString();
          maxPrice = getdata[MAXPRICE].toString();

          _isFirstLoad = false;
        }

        if ((offset) < total) {
          tempList!.clear();

          var data = getdata['data'];
          // print("Data : ${getdata['data']}");
          tempList =
              (data as List).map((data) => Product.fromJson(data)).toList();

          if (getdata.containsKey(TAG)) {
            List<String> tempList = List<String>.from(getdata[TAG]);
            if (tempList.isNotEmpty) tagList = tempList;
          }

          getAvailVarient();

          offset = offset + perPage;
        } else {
          if (msg != 'Products Not Found !') setSnackbar(msg!, context);
          isLoadingmore = false;
        }
      } else {
        isLoadingmore = false;
        if (msg != 'Products Not Found !') setSnackbar(msg!, context);
      }

      setState(() {
        _isLoading = false;
      });
      // context.read<ProductListProvider>().setProductLoading(false);
    }, onError: (error) {
      setSnackbar(error.toString(), context);
      setState(() {
        _isLoading = false;
      });
      //context.read<ProductListProvider>().setProductLoading(false);
    });
  }
}
