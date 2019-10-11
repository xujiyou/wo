import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linli/api/auth_api.dart';
import 'package:linli/scoped_model/global_model.dart';
import 'package:linli/util/shared_preferences_util.dart';
import 'package:scoped_model/scoped_model.dart';

enum AuthErrType{NET_ERR, TEXT_ERR}

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool showPass = false; //是否显示密码

  @override
  void initState() {
    super.initState();
    findPhoneFromCache();
  }

  void findPhoneFromCache() {
    SharedPreferencesUtil.handleCache((prefs) {
      String phone = prefs.getString("phone") ?? "";
      String password = prefs.getString("password") ?? "";
      phoneController.text = phone;
      passController.text = password;
    });
  }

  void loginSuccess() {
    globalModel.judgeLogin();
    Navigator.of(context).pop();
  }

  void submit() async {
    phoneFocusNode.unfocus();
    passFocusNode.unfocus();
//    Map map = await AuthApi.login(phoneController.text, passController.text);
//    log("登录结果：" + map.toString());
    String id = "123456", token = "123456";
    if (id != "" && token != "") {
      await saveTokenToCache(id, phoneController.text, token, passController.text);
      loginSuccess();
    } else {
      String errMsg = "errmsg";
      if (errMsg == "302") {
        alert('手机号或密码错误', '请重新检查手机号与密码', AuthErrType.TEXT_ERR);
      } else {
        alert('网络错误', "抱歉，请检查网络链接后重试", AuthErrType.NET_ERR);
      }
    }
  }

  /// 缓存用户 id 和 token
  Future saveTokenToCache(String userId, String phone, String token, String password) async {
    await SharedPreferencesUtil.handleCache((prefs) {
      prefs.setString("phone", phone);
      prefs.setString("id", userId);
      prefs.setString("token", token);
      prefs.setString("password", password);
    });
  }

  /// 弹窗提示用户密码错误,或网络错误
  Future<Null> alert(String title, String desc, AuthErrType authErr) {
    Widget button;
    if (authErr == AuthErrType.NET_ERR) {
      button = FlatButton(
          child: Text('OK', style: TextStyle(color: Theme.of(context).accentColor)),
          onPressed: () => Navigator.of(context).pop()
      );
    } else {
      button = FlatButton(
          child: Text('检查', style: TextStyle(color: Theme.of(context).accentColor)),
          onPressed: () {
            Navigator.of(context).pop();
            showPass = true;
            setState(() {});
          }
      );
    }

    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // 用户必须点击按钮
      builder: (BuildContext context) {

        return AlertDialog(
          title: Text(title),
          content: Text(desc),
          actions: <Widget>[button],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    Color primaryColor = theme.accentColor;
    Color disableColor = Color(0xFF999999);

    //顶部logo
    Widget titleWidget =  Container(
      margin: EdgeInsets.only(top: height * 0.1, bottom: height * 0.04),
      child: Text("邻里社区", style: TextStyle(color: Colors.white, fontSize: 38.0, fontFamily: "kaiti")),
    );

    //手机号输入组件
    Widget phoneWidget = Container(
      margin: EdgeInsets.only(left: 32.0, right: 32.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.white70))
      ),
      child: TextField(
        onSubmitted: (text) {
          if (text.isNotEmpty) {
            phoneFocusNode.unfocus();
            FocusScope.of(context).requestFocus(passFocusNode);
          }
        },
        onChanged: (text) => setState(() {}),
        focusNode: phoneFocusNode,
        controller: phoneController,
        cursorColor: primaryColor,
        keyboardType: TextInputType.phone,
        style: TextStyle(color: Colors.white, letterSpacing: 1.0),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: Icon(Icons.person_outline, color: Colors.white,),
          border: InputBorder.none,
          hintText: "手机号",
          hintStyle: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: "kaiti"),
          contentPadding: EdgeInsets.only(top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    );

    //密码输入组件
    Widget passWidget =  Container(
      margin: EdgeInsets.only(left: 32.0, right: 32.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.white70))
      ),
      child: TextField(
        onSubmitted: (text) {
          if (text.isNotEmpty) submit();
        },
        onChanged: (text) => setState(() {}),
        focusNode: passFocusNode,
        controller: passController,
        cursorColor: primaryColor,
        keyboardType: TextInputType.text,
        obscureText: !showPass,
        style: TextStyle(color: Colors.white, letterSpacing: 1.0),
        decoration: InputDecoration(
          suffixIcon:  GestureDetector(
            onTap: () => setState(() => showPass = !showPass),
            child: Icon(
                showPass == false ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                size: 16.0,
                color: Colors.white70
            ),
          ),
          icon: Icon(Icons.lock_outline, color: Colors.white,),
          border: InputBorder.none,
          hintText: "密码",
          hintStyle: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: "kaiti"),
          contentPadding: EdgeInsets.only(top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    );

    //忘记密码按钮
    Widget forgetPassWidget = Container(
      margin: EdgeInsets.only(left: 28.0, right: 28.0, top: 4.0, bottom: 8.0),
      child: FlatButton(
          onPressed: () {},
          child: Text("忘记密码", style: TextStyle(color: Colors.white, fontSize: 12.0, fontFamily: "kaiti"))
      ),
    );

    //登录按钮
    Widget loginWidget = Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 80.0, right: 80.0),
      height: 46.0,
      child: FlatButton(
        shape: StadiumBorder(),
        color: primaryColor.withOpacity(0.9),
        disabledColor: disableColor.withOpacity(0.7),
        onPressed:() => submit(),
        child: Text("登录", style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: "kaiti"),),
      ),
    );

    Widget scaffold = Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: height,
              decoration: BoxDecoration( //背景
                image: DecorationImage(image: ExactAssetImage("asset/images/blue.jpeg"), fit: BoxFit.cover),
              ),
              child: Container(
                color: theme.primaryColor.withOpacity(0.5),
                child: Column(
                  children: <Widget>[
                    titleWidget,
                    phoneWidget,
                    passWidget,
                    forgetPassWidget,
                    loginWidget
                  ],
                ),
              )
          ),
        )
    );

    return GestureDetector(
        onTap: () { //点击页面任意一个地方，取消对文本框的聚焦
          phoneFocusNode.unfocus();
          passFocusNode.unfocus();
        },
        child: MaterialApp(
            theme: theme.copyWith(primaryColorBrightness: Brightness.light),
            home: scaffold
        )
    );
  }

}