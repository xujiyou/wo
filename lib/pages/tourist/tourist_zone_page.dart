import 'package:flutter/material.dart';

class TouristZonePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristZonePageState();
}

class _TouristZonePageState extends State<TouristZonePage> with AutomaticKeepAliveClientMixin<TouristZonePage> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ListView(
        padding: EdgeInsets.only(bottom: kToolbarHeight + 20.0),
        children: <Widget>[
          SizedBox(height: 60.0),
          Container(
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

          Container(
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
          Container(
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
          Container(
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
          )
        ]
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}