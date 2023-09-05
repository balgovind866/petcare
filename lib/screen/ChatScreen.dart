import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcare/constants/ConstantColors.dart';
import 'package:petcare/constants/ConstantWidgets.dart';
import 'package:petcare/model/User.dart';

import '../model/Message.dart';

class ChatScreen extends StatefulWidget {
  final User? user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> _chatList = [];

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? EdgeInsets.only(top: 7.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: isMe
          ? BoxDecoration(
              color: "#52575C".toColor(),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)))
          : BoxDecoration(
              color: Colors.grey.shade200,
              // color: Color(0xFFe4f1fe),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time!,
            style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 13.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(message.text!,
              style: TextStyle(
                  color: isMe ? Colors.white : Colors.black87,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        // IconButton(
        //   icon: message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        //   iconSize: 30.0,
        //   color: message.isLiked ? Colors.red : Colors.blueGrey,
        //   onPressed: () {},
        // ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration(hintText: 'Send a message..'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              if (_textEditingController.text.isNotEmpty) {
                DateTime now = DateTime.now();
                DateFormat formatter = DateFormat('hh:mm a');
                String formatted = formatter.format(now);
                _chatList.insert(
                    0,
                    Message(
                        sender: currentUser,
                        time: formatted,
                        // time: '5:30 PM',
                        text: _textEditingController.text.toString(),
                        isLiked: true,
                        unread: false));
                setState(() {
                  _textEditingController.clear();
                });
              }
            },
          ),
        ],
      ),
    );
  }

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ConstantColors.bgColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: getCustomText(widget.user!.name ?? "", textColor, 1,
                TextAlign.center, FontWeight.bold, 20),
            centerTitle: true,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: textColor,
              onPressed: () {
                finish();
              },
            ),
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.more_horiz),
            //     iconSize: 30.0,
            //     color: Colors.white,
            //     onPressed: () {},
            //   ),
            // ],
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: <Widget>[
                // SizedBox(
                //   height: 10.0,
                // ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  // decoration: BoxDecoration(
                  // color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(30.0),
                  //     topRight: Radius.circular(30.0))
                  // ),
                  // child: ClipRRect(
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(30.0),
                  //     topRight: Radius.circular(30.0)
                  // ),
                  child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 14.0),
                      itemCount: _chatList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = _chatList[index];
                        final bool isMe = message.sender!.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      }),
                )),
                // ),
                _buildMessageComposer(),
              ],
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
