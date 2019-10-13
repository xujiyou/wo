import 'package:flutter/material.dart';
import 'package:linli/scoped_model/global_model.dart';
import 'package:linli/util/shared_preferences_util.dart';

class BusinessCardMakePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BusinessCardMakePageState();
}

class _BusinessCardMakePageState extends State<BusinessCardMakePage> {

  Future saveTokenToCache() async {
    await SharedPreferencesUtil.handleCache((prefs) {
      prefs.setBool("firstJoin", false);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 100.0),
          Container(
            alignment: Alignment.center,
            child: Text("邻里社区·欢迎加入", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, fontFamily: "kaiti"),),
          ),
          Expanded(child: Container()),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 80.0, right: 80.0, bottom: 200.0),
            height: 46.0,
            child: FlatButton(
              shape: StadiumBorder(),
              color: theme.primaryColor.withOpacity(0.9),
              disabledColor: theme.dividerColor,
              onPressed: () {
                saveTokenToCache();
                globalModel.judgeLogin();
              },
              child: Text("现在加入", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0, fontFamily: "kaiti"),),
            ),
          )
        ],
      ),
    );
  }

}