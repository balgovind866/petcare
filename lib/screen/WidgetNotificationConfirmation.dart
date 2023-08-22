import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/customwidget/parallax.dart';
import 'package:petcare/screen/LoginPage.dart';
// import 'package:transformer_page_view/transformer_page_view.dart';
import '../constants/ConstantColors.dart';
import '../generated/l10n.dart';

class WidgetNotificationConfirmation extends StatefulWidget {
  @override
  _WidgetNotificationConfirmation createState() =>
      _WidgetNotificationConfirmation();
}

class _WidgetNotificationConfirmation
    extends State<WidgetNotificationConfirmation> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          body: new Container(
            alignment: Alignment.center,
            color: ConstantColors.bgColor,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new ParallaxContainer(
                    child: getCustomText(S.of(context).app_name, accentColors, 1,
                        TextAlign.center, FontWeight.bold, 28),
                    position: 0,
                  ),
                  // SizedBox(
                  //   height: 45.0,
                  // ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical !* 2,
                  ),
                  new ParallaxContainer(
                    child: new Image.asset(
                      Constants.assetsImagePath + "img_allow_notification.png",
                      fit: BoxFit.contain,
                      width: SizeConfig.safeBlockHorizontal !* 70,
                      height: SizeConfig.safeBlockVertical !* 40,
                    ),
                    translationFactor: 400.0,
                    position: 0,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical !* 2,
                  ),
                  // SizedBox(
                  //   height: 45.0,
                  // ),
                  new ParallaxContainer(
                    child: getCustomText(S.of(context).notifications, textColor, 1,
                        TextAlign.center, FontWeight.w600, 20),
                    translationFactor: 400.0,
                    position: 0,
                  ),
                  new ParallaxContainer(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: getCustomText(
                          S.of(context).stayNotifiedAboutCourseUpdatesnnewExamToolsAndChangeTonthe,
                          textColor,
                          3,
                          TextAlign.center,
                          FontWeight.normal,
                          16),
                    ),
                    translationFactor: 300.0,
                    position: 0,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical !* 1.5,
                  ),

                  // new ParallaxContainer(
                  new ParallaxContainer(
                    child: InkWell(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // primary: Colors.red,
                            primary: accentColors,
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            // onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(22.0),
                            ),
                          ),
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: new BorderRadius.circular(22.0),
                          // ),
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: 30, vertical: 10),
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                          },
                          // color: accentColors,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              getCustomText(S.of(context).allow, Colors.white, 1,
                                  TextAlign.center, FontWeight.w400, 18),
                            ],
                          )),
                    ),
                    position: 0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new ParallaxContainer(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                      },
                      child: getCustomText(S.of(context).skip, accentColors, 1,
                          TextAlign.center, FontWeight.w500, 18),
                    ),
                    position: 0,
                    opacityFactor: 0.7,
                    // opacityFactor: 2.5,
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
