import 'dart:async';

import 'package:flutter/material.dart';
import 'package:linli/pages/auth/business_card_make_page.dart';

class RegisterInvitePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterInvitePageState();
}

class _RegisterInvitePageState extends State<RegisterInvitePage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  FocusNode verificationCodeFocus = FocusNode();
  FocusNode codeFocus = FocusNode();
  Timer timer;
  int seconds = 60;

  void submit() {

    Navigator.of(context).push(MaterialPageRoute(builder: (c) => BusinessCardMakePage()));
  }

  void validatePhone() async {
    seconds--;
    setState(() {});
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (seconds == 0) {
        timer.cancel();
        seconds = 60;
      } else {
        seconds--;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    Color primaryColor = theme.primaryColor;

    Widget phoneInputWidget = Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.white70)),
      ),
      child: TextField(
        onSubmitted: (text) {
          if (text.isNotEmpty) {
            FocusScope.of(context).requestFocus(verificationCodeFocus);
          }
        },
        onChanged: (text) => setState(() {}),
        focusNode: phoneFocus,
        controller: phoneController,
        keyboardType: TextInputType.phone,
        cursorColor: primaryColor,
        style: TextStyle(color: Colors.white, letterSpacing: 1.0),
        decoration: InputDecoration(
          icon: Icon(Icons.person_outline, color: Colors.white),
          border: InputBorder.none,
          hintText: "手机号",
          hintStyle: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: "kaiti"),
          contentPadding: EdgeInsets.only(top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    );

    Widget smsWidget = Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.white70)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onSubmitted: (text) {
                if (text.isNotEmpty) {
                  FocusScope.of(context).requestFocus(codeFocus);
                }
              },
              onChanged: (text) => setState(() {}),
              focusNode: verificationCodeFocus,
              controller: verificationCodeController,
              keyboardType: TextInputType.text,
              cursorColor: primaryColor,
              style: TextStyle(color: Colors.white, letterSpacing: 1.0),
              decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.white),
                border: InputBorder.none,
                hintText: "4位短信验证码",
                hintStyle: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: "kaiti"),
                contentPadding: EdgeInsets.only(top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
              ),
            ),
          ),
          FlatButton(
              padding: EdgeInsets.zero,
              color: phoneController.text.isEmpty ? theme.dividerColor : seconds == 60 ? primaryColor : theme.dividerColor,
              onPressed: () {
                if (seconds == 60) {
                  validatePhone();
                }
              },
              child: Text(
                  seconds == 60 ? "发送验证码" : "$seconds 秒后重发",
                  style: TextStyle(color: Colors.white, fontSize: 12.0, fontFamily: "kaiti"))
          )
        ],
      ),
    );

    Widget codeWidget =  Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.white70)),
      ),
      child: TextField(
        onSubmitted: (text) {
          if (text.isNotEmpty) {

          }
        },
        onChanged: (text) => setState(() {}),
        focusNode: codeFocus,
        controller: codeController,
        keyboardType: TextInputType.text,
        cursorColor: primaryColor,
        style: TextStyle(color: Colors.white, letterSpacing: 1.0),
        decoration: InputDecoration(
          icon: Icon(Icons.last_page, color: Colors.white),
          border: InputBorder.none,
          hintText: "请输入6位邀请码，不区分大小写",
          hintStyle: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: "kaiti"),
          contentPadding: EdgeInsets.only(top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    );

    Widget registerButton = Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 60.0, right: 60.0, top: 50.0),
      height: 46.0,
      child: FlatButton(
        shape: StadiumBorder(),
        color: theme.primaryColor.withOpacity(0.9),
        disabledColor: theme.dividerColor,
        onPressed: () => submit(),
        child: Text("加入邻里社区", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0, fontFamily: "kaiti"),),
      ),
    );

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("asset/images/wall.jpeg"),
              fit: BoxFit.cover
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.46),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 36.0,),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.chevron_left, color: Colors.white,),
                    ),
                    SizedBox(width: 4.0),
                    Container(
                      child: Text("通过邀请码加入邻里社区", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white, fontFamily: "kaiti")),
                    )
                  ],
                ),
                SizedBox(height: 24.0),
                phoneInputWidget,
                smsWidget,
                codeWidget,
                registerButton
              ],
            ),
          )
        ),
      )
    );
  }

}