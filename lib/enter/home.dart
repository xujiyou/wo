import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linli/pages/tourist/tourist_home_page.dart';
import 'package:linli/pages/user/user_home_page.dart';
import 'package:linli/scoped_model/global_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget home;

  @override
  void initState() {
    super.initState();
  }

  Widget _loading() {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoActivityIndicator(radius: 12.0),
              SizedBox(height: 6.0),
              Text("正在加载数据，请稍等...", style: TextStyle(color: Theme.of(context).dividerColor))
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalModel globalModel = ScopedModel.of<GlobalModel>(context);
    if (globalModel.userLoginState == UserLoginState.HOME) {
      home = UserHomePage();
    } else if (globalModel.userLoginState == UserLoginState.LOGIN) {
      home = TouristHomePage();
    } else {
      home = _loading();
    }

    if (!Platform.isIOS && !Platform.isAndroid) {
      home = TouristHomePage();
    }

    return home;
  }

}