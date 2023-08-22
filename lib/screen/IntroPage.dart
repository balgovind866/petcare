import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/data/PrefData.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/main.dart';
import 'package:petcare/model/IntroModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  // final ValueChanged<bool> onChanged;

  // IntroPage(this.onChanged);

  @override
  _IntroPage createState() => _IntroPage();
}

class _IntroPage extends State<IntroPage> {
  int _position = 0;

  // final ValueChanged<bool> onChanged;

  // _IntroPage(this.onChanged);

  Future<bool> _requestPop() {
    Future.delayed(const Duration(milliseconds: 200), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });

    return new Future.value(false);
  }

  final controller = PageController();

  List<IntroModel> introModelList=[];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    introModelList = DataFile.getIntroModel(context);

    double imageSize = SizeConfig.safeBlockVertical !* 35;
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          body: Stack(
            children: [
              // Container(
              //   child: PageView.builder(
              //     controller: controller,
              //     itemBuilder: (context, position) {
              //       return Container(
              //         margin: EdgeInsets.all(
              //             MediaQuery.of(context).size.height * 0.03),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.only(bottom: 20),
              //               child: IconButton(
              //                 icon: new Image.asset(Constants.assetsImagePath+
              //                     introModelList[position].image,width: imageSize,height:imageSize,fit: BoxFit.fitWidth,),
              //                 iconSize: imageSize,
              //                 onPressed: () {},
              //               ),
              //             ),
              //             Padding(
              //               padding: EdgeInsets.all(15),
              //               child:
              //               getCustomTextWithoutMax(introModelList[position].name,textColor,TextAlign.start,FontWeight.bold,25),
              //             ),
              //             getCustomTextWithoutMax(introModelList[position].desc,primaryTextColor,TextAlign.center,FontWeight.w500,15),
              //
              //             // Container(
              //             //   margin: EdgeInsets.all(40),
              //             //   child: getIndicator(position),
              //             // )
              //           ],
              //         ),
              //       );
              //     },
              //     itemCount: introModelList.length,
              //     onPageChanged: _onPageViewChange,
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      child: PageView.builder(
                        controller: controller,
                        itemBuilder: (context, position) {
                          return Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: IconButton(
                                    icon: new Image.asset(
                                      Constants.assetsImagePath +
                                          introModelList[position].image!,
                                      width: imageSize,
                                      height: imageSize,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    iconSize: imageSize,
                                    onPressed: () {},
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: getCustomTextWithoutMax(
                                      introModelList[position].name??"",
                                      textColor,
                                      TextAlign.start,
                                      FontWeight.bold,
                                      25),
                                ),
                                AutoSizeText(
                                  introModelList[position].desc??"",
                                  style: TextStyle(
                                      fontFamily: Constants.fontsFamily,
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                // getCustomTextWithoutMax(
                                //     introModelList[position].desc,
                                //     primaryTextColor,
                                //     TextAlign.center,
                                //     FontWeight.w500,
                                //     15),

                                // Container(
                                //   margin: EdgeInsets.all(40),
                                //   child: getIndicator(position),
                                // )
                              ],
                            ),
                          );
                        },
                        itemCount: introModelList.length,
                        onPageChanged: _onPageViewChange,
                      ),
                    ),
                    flex: 1,
                  ),
                  Container(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: introModelList.length,
                      effect: ScaleEffect(
                          spacing: 8.0,
                          radius: 10.0,
                          dotWidth: 15,
                          dotHeight: 15,
                          dotColor: disableIconColor,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1,
                          activeDotColor: textColor),
                    ),
                  ),
                  Container(
                      height: 50,
                      margin: EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Visibility(
                          visible: (_position == 2),
                          child: InkWell(
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: InkWell(
                                  child: Center(
                                    child: getCustomText(
                                        S.of(context).getStarted,
                                        Colors.white,
                                        1,
                                        TextAlign.center,
                                        FontWeight.w900,
                                        15),
                                  ),
                                )),
                            onTap: () {
                              PrefData.setIsIntro(false);
                              // widget.onChanged(true);
                              Navigator.of(context).pop(true);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChoosePage()));
                            },
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
        onWillPop: _requestPop);
  }

  Widget getIndicator(int position) {
    double selectSize = 30;
    double unSelectSize = 15;

    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            (position == 0) ? Icons.radio_button_checked : Icons.brightness_1,
            size: (position == 0) ? selectSize : unSelectSize,
            color: (position == 0) ? textColor : disableIconColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Icon(
              (position == 1) ? Icons.radio_button_checked : Icons.brightness_1,
              size: (position == 1) ? selectSize : unSelectSize,
              color: (position == 1) ? textColor : disableIconColor,
            ),
          ),
          Icon(
            (position == 2) ? Icons.radio_button_checked : Icons.brightness_1,
            size: (position == 2) ? selectSize : unSelectSize,
            color: (position == 2) ? textColor : disableIconColor,
          ),
        ],
      ),
    );
  }

  _onPageViewChange(int page) {
    _position = page;
    setState(() {});
  }
}
