import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:petcare/constants/ConstantColors.dart';

class Constants {
  static String assetsImagePath = "assets/images/";
  static String fontsFamily = 'Poppins';
  static double topToolbarPadding = 25;
  static DateFormat myDateFormat = new DateFormat("EEE,dd MMM,yyyy");
  static const double padding = 20;
  static const double avatarRadius = 40;
  static const NONE_CAT = 0;
  static const SHOPPING_ID = 1;
  static const TREATMENT_ID = 2;
  static const PET_HOTEL_ID = 3;
  static const ADOPTION_ID = 4;
  static ThemeData themeData = ThemeData();
  static double bottomTxt = 23;
  static double topTxt = 21;
  static double subContainer = 40;
  static double subContainer2 = 45;
  static double discountVal = 3;
  static const String registerSuccessMsg = "User Registered Successfully";
  static const String somethingMsg =
      "Something went wrong. Please try again after some time";

  // static Color primaryColor = "#14B4AB".toColor();

  static double getPercentSize(double total, int percent) {
    return (total * percent) / 100;
  }

  static stopApp() {
    Future.delayed(const Duration(milliseconds: 200), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }
  // static setThemePosition() async {
  //   int posGet = await PrefData().getIsDarkMode();
  //   themeData = ThemeNotifier.themesList[posGet];
  //   // ConstantDatas.bottomNavColor = ThemeNotifier.themeConstantColors.bgColorsList[getThemePos];
  //   // ConstantDatas.primaryColor = ThemeNotifier.themeColorsList[getThemePos];
  //   // print("getcolor3=${ConstantDatas.primaryColor}");
  //   ConstantColors.bgColor = themeData.colorScheme.background;
  //   // ConstantColors.bgColor = themeData.backgroundColor;
  //   cardColor = themeData.cardColor;
  //   shadowColor = Colors.transparent;
  //   lightPrimaryColors = themeData.primaryColorLight;
  //   ConstantColors.profileBgColor = themeData.canvasColor;
  //   textColor = themeData.textSelectionTheme.selectionColor!;
  //   primaryTextColor= themeData.textSelectionTheme.selectionHandleColor!;
  // }

  static double getPercentSize1(double total, double percent) {
    return (total * percent) / 100;
  }

  // static setThemePosition() async {
  //   int posGet = await PrefData().getIsDarkMode();
  //   themeData = ThemeNotifier.ThemesList[posGet];
  //   // ConstantDatas.bottomNavColor = ThemeNotifier.themeConstantColors.bgColorsList[getThemePos];
  //   // ConstantDatas.primaryColor = ThemeNotifier.themeColorsList[getThemePos];
  //   // print("getcolor3=${ConstantDatas.primaryColor}");
  //   ConstantColors.bgColor = themeData.backgroundColor;
  //   // ConstantColors.bgColor = themeData.backgroundColor;
  //   cardColor = themeData.cardColor;
  //   ConstantColors.profileBgColor = themeData.canvasColor;
  //   textColor = themeData.textSelectionTheme.selectionColor;
  //   primaryTextColor= themeData.textSelectionTheme.selectionHandleColor;
  // }

  static double getScreenPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.height * percent) / 100;
  }

  static Color getOrderColor(String s) {
    if (s.contains("On Delivery")) {
      return "#FFEDCE".toColor();
    } else if (s.contains("Completed")) {
      return primaryColor;
    } else {
      return Colors.red;
    }
  }

  static Color getIconColor(String s) {
    if (s.contains("On Delivery")) {
      return accentColors;
    } else {
      return Colors.white;
    }
  }

  static Color getColorFromHex(String colors) {
    var color = "0xFF$colors";
    try {
      return Color(int.parse(color));
    } catch (e) {
      print(e);
      return Color(0xFFFFFFFF);
    }
  }
}
