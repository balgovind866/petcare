import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'StorageManager.dart';

class ThemeNotifier with ChangeNotifier {
  // static Color colorPrimary="#00B3A2".toColor();
  // static Color navcolorPrimary="#9DE6E0".toColor();
  // static Color deepPurpleColorPrimary="#673AB7".toColor();
  // static Color navdeepPurpleColorPrimary="#9B7ECD".toColor();
  // static Color pinkColorPrimary="#E82E6D".toColor();
  // static Color navpinkColorPrimary="#E3779C".toColor();
  // static Color orangeColorPrimary="#FE5722".toColor();
  // static Color navorangeColorPrimary="#F4A890".toColor();
  // static Color greenColorPrimary="#4CAF50".toColor();
  // static Color navgreenColorPrimary="#A8E1AA".toColor();
  // static Color grayColorPrimary="#607D8B".toColor();
  // static Color navgrayColorPrimary="#A9C6D3".toColor();

  // static final themeColorsList = <Color>[colorPrimary,deepPurpleColorPrimary,pinkColorPrimary,orangeColorPrimary,greenColorPrimary,grayColorPrimary];
  // static final theme.ConstantColors.bgColorsList = <Color>[navcolorPrimary,navdeepPurpleColorPrimary,navpinkColorPrimary,navorangeColorPrimary,navgreenColorPrimary,navgrayColorPrimary];

  static ThemeData darkTheme = ThemeData(
    primaryColor: "#14B4AB".toColor(),
    // primaryColor: Colors.black,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: "#323635".toColor(),
    cardColor: "#252525".toColor(),
    primaryColorLight: "#252525".toColor(),
    shadowColor: Colors.grey.shade300,
    // textSelectionColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.red,
      selectionColor: Colors.white,
      selectionHandleColor: Colors.white70,
    ),
    textTheme: TextTheme().apply(bodyColor: Colors.white),
    canvasColor: "#252525".toColor(),
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: Colors.white)
        .copyWith(background: "#323635".toColor()),
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: "#14B4AB".toColor(),
    // primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorLight: "#ECEDFA".toColor(),
    shadowColor: Colors.grey.shade300,
    scaffoldBackgroundColor: "#F2F6F9".toColor(),
    cardColor: Colors.white,
    canvasColor: "#E4E6ED".toColor(),
    textTheme: TextTheme().apply(bodyColor: Colors.black87),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.red,
      selectionColor: "#000000".toColor(),
      selectionHandleColor: "#3F3F41".toColor(),
    ),
    dividerColor: Colors.white54,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: Colors.black)
        .copyWith(background: "#F2F6F9".toColor()),
  );

  static final themesList = <ThemeData>[lightTheme, darkTheme];

  ThemeData _themeData = ThemeData();

  ThemeData getTheme() {
    print("themedata===$_themeData");
    return _themeData;
  }

  getThemeDatas() async {
    // ThemeData data;

    if (await isDarkTheme()) {
      print("darktheme==true");
      return darkTheme;
    } else {
      print("darktheme==false");
      return lightTheme;
    }
    // final prefs = await SharedPreferences.getInstance();
    // prefs.get('themeMode');
    // String getval = prefs.getString('themeMode') ?? 'light';
    // if (getval == 'light') {
    //   return lightTheme;
    // } else {
    //   return darkTheme;
    // }
  }

  isDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.get('themeMode');
    String getval = prefs.getString('themeMode') ?? 'light';
    print("getval===$getval");
    if (getval == 'light') {
      return false;
    }
    return true;
  }

  // StorageManager.readData('themeMode').then((value) {
  //   print('value read from storage: ' + value.toString());
  //   // var themeMode = value ?? 'dark';
  //   var themeMode = value ?? 'light';
  //   print("theme modes===$themeMode");
  //   if (themeMode == 'light') {
  //     data = lightTheme;
  //   } else {
  //     print('setting dark theme');
  //     data = darkTheme;
  //   }
  //   print("themedatas===$data");
  //   return data;
  // });

  // return data;
  // }

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      // var themeMode = value ?? 'dark';
      var themeMode = value ?? 'light';
      print("theme mode===$themeMode");
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
