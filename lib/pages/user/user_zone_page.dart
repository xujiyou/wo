import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linli/pages/common/about_page.dart';
import 'package:linli/pages/common/feedback_page.dart';

class UserZonePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserZonePageState();
}

class _UserZonePageState extends State<UserZonePage> with AutomaticKeepAliveClientMixin<UserZonePage> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ListView(
          padding: EdgeInsets.only(bottom: kToolbarHeight + 20.0),
          children: <Widget>[
            SizedBox(height: 60.0),

            GestureDetector(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 36.0,
                      backgroundColor: theme.primaryColor,
                      child: Icon(Icons.person_outline, color: Colors.white, size: 32.0,),
                    ),
                    SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("请登录", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, fontFamily: "kaiti")),
                        SizedBox(height: 4.0),
                        Text("通过邻居邀请加入")
                      ],
                    )
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => AboutPage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: theme.backgroundColor,
                      child: Icon(FontAwesomeIcons.userPlus, color: theme.primaryColor, size: 14.0),
                    ),
                    SizedBox(width: 12.0),
                    Text("邀请")
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => AboutPage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: theme.backgroundColor,
                      child: Icon(Icons.center_focus_strong, color: theme.primaryColor, size: 18.0),
                    ),
                    SizedBox(width: 12.0),
                    Text("关于")
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => FeedbackPage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: theme.backgroundColor,
                      child: Icon(Icons.flag, color: theme.primaryColor, size: 18.0,),
                    ),
                    SizedBox(width: 12.0),
                    Text("反馈")
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: theme.backgroundColor,
                      child: Icon(Icons.settings, color: theme.primaryColor, size: 18.0),
                    ),
                    SizedBox(width: 12.0),
                    Text("设置")
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}