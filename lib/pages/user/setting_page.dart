import 'package:flutter/material.dart';
import 'package:linli/scoped_model/global_model.dart';
import 'package:linli/util/shared_preferences_util.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  bool messageNotice = true;
  bool privacyProtect = true;

  void logout() {
    SharedPreferencesUtil.handleCache((prefs) {
      prefs.remove("id");
      prefs.remove("token");
      globalModel.judgeLogin();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            SizedBox(height: 36.0,),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.chevron_left),
                ),
                SizedBox(width: 12.0),
                Container(
                  child: Text("设置", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,  fontFamily: "kaiti")),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Row(
                children: <Widget>[
                  Text("消息通知", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti"),),
                  Expanded(child: Container()),
                  Switch(
                    activeColor: theme.accentColor,
                    value: messageNotice,
                    onChanged: (value) {
                      setState(() {
                        messageNotice = value;
                      });
                    }
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Row(
                children: <Widget>[
                  Text("隐私保护", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti"),),
                  Expanded(child: Container()),
                  Switch(
                      activeColor: theme.accentColor,
                      value: privacyProtect,
                      onChanged: (value) {
                        setState(() {
                          privacyProtect = value;
                        });
                      }
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 22.0, bottom: 22.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Row(
                children: <Widget>[
                  Text("软件更新", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti"),),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 60.0, right: 60.0, top: 24.0, bottom: 16.0),
              height: 42.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(21.0)),
              child: FlatButton(
                  shape: StadiumBorder(),
                  onPressed: () => logout(),
                  child: Container(
                    child: Text(
                      "退出登录",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontFamily: "kaiti"),
                    ),
                  )),
            )
          ],
        )
    );
  }

}