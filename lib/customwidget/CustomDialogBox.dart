import 'package:flutter/material.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/constants/Constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, text;
  final Image? img;
  final Function? func;

  const CustomDialogBox(
      {Key? key, this.title, this.descriptions, this.text, this.img, this.func})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          // decoration: BoxDecoration(
          //     shape: BoxShape.rectangle,
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(Constants.padding),
          //     boxShadow: [
          //       BoxShadow(color: Colors.black,offset: Offset(0,10),
          //           blurRadius: 10
          //       ),
          //     ]
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              getCustomText(widget.title ?? "", Colors.black, 1,
                  TextAlign.center, FontWeight.w600, 20)
              // Text(
              //   widget.title,
              //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              // )
              ,
              SizedBox(
                height: 10,
              ),
              getCustomText(widget.descriptions ?? "", Colors.black87, 2,
                  TextAlign.center, FontWeight.normal, 14)
              // Text(
              //   widget.descriptions,
              //   style: TextStyle(fontSize: 14),
              //   textAlign: TextAlign.center,
              // )
              ,
              SizedBox(
                height: 22,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: double.infinity,
                child: getRoundCornerButtonWithoutIcon(
                    widget.text ?? "", accentColors, Colors.white, 20, () {
                  Navigator.of(context).pop();
                  widget.func!();
                }),
              )
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child:
              //   getRoundCornerButtonWithoutIcon(
              //       widget.text, accentColor, Colors.white, 20, () {
              //     Navigator.of(context).pop();
              //   }),
              //   // child: FlatButton(
              //   //     onPressed: () {
              //   //       Navigator.of(context).pop();
              //   //     },
              //   //     child: Text(
              //   //       widget.text,
              //   //       style: TextStyle(fontSize: 18),
              //   //     )),
              // ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset(
                  Constants.assetsImagePath + "security.png",
                  color: accentColors,
                )),
          ),
        ),
      ],
    );
  }
}
