import 'package:flutter/material.dart';
import 'package:linli/pages/user/invite_user_history_page.dart';

class InviteUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InviteUserPageState();
}

class _InviteUserPageState extends State<InviteUserPage> {
  TextEditingController buildController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController doorController = TextEditingController();
  FocusNode buildFocus = FocusNode();
  FocusNode unitFocus = FocusNode();
  FocusNode floorFocus = FocusNode();
  FocusNode doorFocus = FocusNode();

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
                child: Text("邀请邻居", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,  fontFamily: "kaiti")),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    focusNode: buildFocus,
                    cursorColor: theme.accentColor,
                    cursorWidth: 1.0,
                    controller: buildController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: theme.textTheme.body1.color, fontSize: 14.0),
                    decoration: InputDecoration(
                        hintText: "栋",
                        hintStyle: TextStyle(color: theme.hintColor, fontSize: 14.0)
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: TextField(
                    focusNode: unitFocus,
                    cursorColor: theme.accentColor,
                    cursorWidth: 1.0,
                    controller: unitController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: theme.textTheme.body1.color, fontSize: 14.0),
                    decoration: InputDecoration(
                        hintText: "单元",
                        hintStyle: TextStyle(color: theme.hintColor, fontSize: 14.0)
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    focusNode: floorFocus,
                    cursorColor: theme.accentColor,
                    cursorWidth: 1.0,
                    controller: floorController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: theme.textTheme.body1.color, fontSize: 14.0),
                    decoration: InputDecoration(
                        hintText: "层",
                        hintStyle: TextStyle(color: theme.hintColor, fontSize: 14.0)
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: TextField(
                    focusNode: doorFocus,
                    cursorColor: theme.accentColor,
                    cursorWidth: 1.0,
                    controller: doorController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: theme.textTheme.body1.color, fontSize: 14.0),
                    decoration: InputDecoration(
                        hintText: "门牌号， 如501",
                        hintStyle: TextStyle(color: theme.hintColor, fontSize: 14.0)
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0,),
          Container(
            width: double.infinity,
            height: 44.0,
            margin: EdgeInsets.symmetric(horizontal: 54.0),
            child: FlatButton(
              color: theme.accentColor,
              shape: StadiumBorder(),
              onPressed: () {},
              child: Text("邀请", style: TextStyle(color: Colors.white, fontFamily: "kaiti")),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            width: double.infinity,
            height: 44.0,
            margin: EdgeInsets.symmetric(horizontal: 54.0),
            child: FlatButton(
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => InviteUserHistoryPage()));
              },
              child: Text("邀请历史", style: TextStyle(color: theme.accentColor, fontFamily: "kaiti")),
            ),
          ),
        ],
      ),
    );
  }

}