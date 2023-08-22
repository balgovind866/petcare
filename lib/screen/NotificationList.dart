import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';
import 'package:petcare/constants/SizeConfig.dart';
import 'package:petcare/data/DataFile.dart';
import 'package:petcare/generated/l10n.dart';
import 'package:petcare/model/ModelNotification.dart';


class NotificationList extends StatefulWidget {
  @override
  _RateProduct createState() => _RateProduct();
}

class _RateProduct extends State<NotificationList> {
  List<ModelNotification> _notificationList = DataFile.getNotificationList();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double totalHeight = SizeConfig.safeBlockHorizontal !* 100;
    double itemHeight = Constants.getPercentSize(totalHeight, 18);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                finish();
              },
              icon: Icon(Icons.arrow_back_ios),
              color: textColor,
            ),
            elevation: 0,
            backgroundColor: ConstantColors.bgColor,
            title: getCustomText(S.of(context).notification, textColor, 1,
                TextAlign.center, FontWeight.bold, 17),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView.builder(
              primary: true,
              shrinkWrap: true,
              padding: EdgeInsets.all(Constants.getPercentSize(itemHeight, 7)),
              itemCount: _notificationList.length,
              itemBuilder: (context, index) {
                ModelNotification _notification = _notificationList[index];
                return Container(
                  decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin:
                      EdgeInsets.all(Constants.getPercentSize(itemHeight, 7)),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: Constants.getPercentSize(itemHeight, 2),
                      horizontal: Constants.getPercentSize(itemHeight, 7)),
                  height: itemHeight,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal !* 2.5),
                        height: Constants.getPercentSize(itemHeight, 45),
                        width: Constants.getPercentSize(itemHeight, 45),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: accentColors),
                        child: Icon(
                          Icons.notifications_outlined,
                          size: Constants.getPercentSize(itemHeight, 30),
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getCustomText(
                                _notification.title,
                                textColor,
                                1,
                                TextAlign.start,
                                FontWeight.bold,
                                Constants.getPercentSize(itemHeight, 18)),
                            getSpace(Constants.getPercentSize(itemHeight, 3)),
                            getCustomText(
                                _notification.desc,
                                primaryTextColor,
                                2,
                                TextAlign.start,
                                FontWeight.w400,
                                Constants.getPercentSize(itemHeight, 15))
                          ],
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        onWillPop: () async {
          finish();
          return false;
        });
  }

  void finish() {
    Navigator.of(context).pop();
  }
}
