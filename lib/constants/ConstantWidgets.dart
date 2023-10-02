import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Constants.dart';

double smallTextSize = 17;
double extraSmallTextSize = 15;
double mediumTextSize = 21;
double largeTextSize = 28;

Widget getCustomText(String text, Color color, int maxLine, TextAlign textAlign,
    FontWeight fontWeight, double textSizes) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: textSizes,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: fontWeight),
    maxLines: maxLine,
    textAlign: textAlign,
  );
}

Widget getCustomTextWithoutMax(String text, Color color, TextAlign textAlign,
    FontWeight fontWeight, double textSizes) {
  return Text(
    text,
    // softWrap: true,

    // overflow: TextOverflow.ellipsis,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: textSizes,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Widget getLabelTitle(String string) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: getCustomText(
        string, Colors.grey, 1, TextAlign.start, FontWeight.bold, 18),
  );
}

void showCustomToast(String texts, BuildContext context) {
  // Toast.show(texts, context,
  //     duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  Fluttertoast.showToast(
      msg: texts,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );

}

BoxDecoration getDecoration() {
  return new BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), //color of shadow
          spreadRadius: 2, //spread radius
          blurRadius: 3, // blur radius
          offset: Offset(0, 1), // changes position of shadow
        ),
//you can set more BoxShadow() here
      ],
      borderRadius: BorderRadius.all(Radius.circular(10.0)));
}

Widget getDivider(double height, Color color) {
  return Divider(
    height: height,
    color: color,
  );
}

Widget getFormField(
    int maxLine, TextEditingController controller, TextInputType type) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: TextField(
      maxLines: maxLine,
      keyboardType: type,
      style: TextStyle(
          color: Colors.black87,
          fontFamily: Constants.fontsFamily,
          fontSize: 18),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 0.5, color: accentColors)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 0.5, color: Colors.grey)),
        hintText: "HintText",
        hintStyle: TextStyle(
            fontSize: 16,
            fontFamily: Constants.fontsFamily,
            color: Color(0xFFB3B1B1)),
      ),
      controller: controller,
    ),
  );
}

Widget getButtonWithColor(String text, Color color, Function function) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ), backgroundColor: color,
    ),
    onPressed: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      child: getCustomText(
          text, Colors.white, 1, TextAlign.center, FontWeight.bold, 16),
    ),
  );
}

Widget getCustomTextWithoutAlign(
    String text, Color color, FontWeight fontWeight, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: Constants.fontsFamily,
        decoration: TextDecoration.none,
        fontWeight: fontWeight),
  );
}

Widget getDialogDivider(double widths) {
  return Container(
      width: double.infinity,
      child: Center(
        child: Container(
          width: widths,
          child: getDivider(3, Colors.grey),
        ),
      ));
}

Widget getButtonWithColorWithSize(String text, Color color,
    double verticalPadding, double fontSize, Function function) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ), backgroundColor: color,
    ),
    onPressed: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      width: double.infinity,
      child: getCustomText(
          text, Colors.white, 1, TextAlign.center, FontWeight.bold, fontSize),
    ),
  );
}

Widget getButtonWithText(String text, Function function) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ), backgroundColor: accentColors,
    ),
    onPressed: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      child: getCustomText(
          text, Colors.white, 1, TextAlign.center, FontWeight.bold, 16),
    ),
  );
}

Widget getBorderButtonWithText(String text, Color buttonColor,
    Color borderColor, Color fontColor, Function function) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0, backgroundColor: buttonColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor, width: 0.5)),
    ),
    onPressed: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      child: getCustomText(
          text, fontColor, 1, TextAlign.center, FontWeight.bold, 16),
    ),
  );
}

Widget getBorderButtonWithSize(
    String text,
    Color buttonColor,
    Color borderColor,
    Color fontColor,
    double padding,
    double fontSize,
    Function function) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0, backgroundColor: buttonColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor, width: 0.5)),
    ),
    onPressed: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      width: double.infinity,
      child: getCustomText(
          text, fontColor, 1, TextAlign.center, FontWeight.bold, fontSize),
    ),
  );
}

Widget getSpace(double space) {
  return SizedBox(
    height: space,
  );
}

Widget getHorizonSpace(double space) {
  return SizedBox(
    width: space,
  );
}

Widget getRowWidget(String title, String val, Color setColor) {
  return Padding(
    padding: EdgeInsets.only(top: 7),
    child: Row(
      children: [
        Expanded(
          child: getCustomText(
              title, setColor, 1, TextAlign.start, FontWeight.bold, 18),
          flex: 1,
        ),
        getCustomText(val, setColor, 1, TextAlign.start, FontWeight.bold, 18)
      ],
    ),
  );
}

Widget getLargeBoldTextWithMaxLine(String text, Color color, int maxLine) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: largeTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.w600),
    maxLines: maxLine,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
  );
}

Widget getFormTitleText(String string) {
  return getCustomText(
      string, Colors.black54, 1, TextAlign.start, FontWeight.w400, 18);
}

Widget getRoundCornerButton(String texts, Color color, Color textColor,
    IconData icons, double btnRadius, Function function) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // primary: Colors.red,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        // onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(btnRadius),
        ),
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius: new BorderRadius.circular(btnRadius),
      // ),
      // padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      onPressed: () {
        function();
      },
      // color: color,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          getCustomText(
              texts, textColor, 1, TextAlign.center, FontWeight.w400, 18),
          SizedBox(
            width: 15,
          ),
          Icon(
            icons,
            size: 25,
            color: textColor,
          )
          // Icon(
          //
          //   icons,
          //   size: 25,
          //   color: textColor,
          // )
        ],
      ));
}

Widget getRoundCornerButtonWithoutIcon(String texts, Color color,
    Color textColor, double btnRadius, Function function) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // primary: Colors.red,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        // onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(btnRadius),
        ),
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius: new BorderRadius.circular(btnRadius),
      // ),
      // padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      onPressed: () {
        function();
      },
      // color: color,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          getCustomText(
              texts, textColor, 1, TextAlign.center, FontWeight.w400, 18)

          // Icon(
          //
          //   icons,
          //   size: 25,
          //   color: textColor,
          // )
        ],
      ));
}

Widget getRoundCornerBorderButton(String texts, Color color, Color borderColor,
    Color textColor, double btnRadius, Function function) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // primary: Colors.red,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        // onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(btnRadius),
            side: BorderSide(color: borderColor, width: 1)),
      ),
      // shape: RoundedRectangleBorder(
      //     borderRadius: new BorderRadius.circular(btnRadius),
      //     side: BorderSide(color: borderColor, width: 1)),
      // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      onPressed: () {
        function();
      },
      // color: color,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          getCustomText(
              texts, textColor, 1, TextAlign.center, FontWeight.w500, 18),
          // Icon(
          //
          //   icons,
          //   size: 25,
          //   color: textColor,
          // )
        ],
      ));
}

Widget getTitleTexts(String txtTitle) {
  return getCustomText(
      txtTitle, Colors.black87, 1, TextAlign.start, FontWeight.w600, 20);
}

getProgressDialog() {
  return new Container(
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
      ),
      child: new Center(child: CupertinoActivityIndicator()));
}
