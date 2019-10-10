import 'package:flutter/material.dart';
import 'package:linli/scoped_model/global_model.dart';
import 'package:linli/util/shared_preferences_util.dart';

class UserHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {

  void logout() {
    SharedPreferencesUtil.handleCache((prefs) {
      prefs.setString("token", "");
      prefs.setString("id", "");
      globalModel.judgeLogin();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("邻里"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => logout(),
          child: Text("注销"),
        ),
      ),
    );
  }

}