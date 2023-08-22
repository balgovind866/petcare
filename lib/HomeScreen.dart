import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/tab/TabProfile.dart';
import 'package:petcare/tab/TabHome.dart';
import 'package:petcare/tab/TabPets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:geolocator/geolocator.dart';

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

class _HomeScreen extends State<HomeScreen> {
  int currentIndex = 0;

  _HomeScreen(this.currentIndex);

  static List<Widget> _widgetOptions = <Widget>[
    TabHome(),
    ShoppingPage(),
    // TabOrder(),
    TabPets(),
    TabProfile()
  ];
  List<Destination> allDestinations = [];

  requestPer() async {
    await Geolocator.requestPermission();
  }

  @override
  void initState() {
    super.initState();
    requestPer();
  }

  @override
  Widget build(BuildContext context) {
    allDestinations = <Destination>[
      Destination(S.of(context).home, CupertinoIcons.home),
      Destination(S.of(context).shopping, CupertinoIcons.bag_fill),
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
}
