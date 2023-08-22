import 'package:petcare/constants/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String pkgName = "com.desk.flutter_petcare";
  static String signIn = pkgName + "signInScreen1";
  static String isIntro = pkgName + "isIntroScreen1";
  static String isDeliveryBoy = pkgName + "isDeliveryBoy1";
  static String selectedMainCategory = pkgName + "selectedCategory1";
  static String darkMode = pkgName+"storyDarkMode1";

  static setIsSignIn(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool(signIn, false);
    prefs.setBool(signIn, isFav);
  }

  static getIsSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(signIn) ?? false;
  }

  setDarkModes(int sizes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(darkMode, sizes);
  }

 setSelectedMainCategory(int sizes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(selectedMainCategory, sizes);
  }

  getIsDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt(darkMode) ?? 0;
    return intValue;
  }

 static getSelectedMainCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt(selectedMainCategory) ?? Constants.NONE_CAT;
    return intValue;
  }

  static setIsIntro(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isIntro, isFav);
  }

  static setIsDeliveryBoy(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDeliveryBoy, isFav);
  }

  static getIsIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isIntro) ?? true;
  }

  static getIsDeliveryBoy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isDeliveryBoy) ?? false;
  }
}
