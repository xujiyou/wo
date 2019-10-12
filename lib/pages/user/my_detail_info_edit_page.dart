import 'package:flutter/material.dart';

class MyDetailInfoEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDetailInfoEditPageState();
}

class _MyDetailInfoEditPageState extends State<MyDetailInfoEditPage> {

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
                child: Text("编辑个人信息", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,  fontFamily: "kaiti")),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Row(
              children: <Widget>[
                Text("头像", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti"),),
                Expanded(child: Container()),
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: theme.primaryColor,
                  child: FlutterLogo(),
                ),
                SizedBox(width: 8.0,),
                Icon(Icons.chevron_right, color: theme.dividerColor,)
              ],
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Row(
              children: <Widget>[
                Text("昵称", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti")),
                Expanded(child: Container()),
                Text("张三", style: TextStyle(fontSize: 14.0),),
                SizedBox(width: 8.0,),
                Icon(Icons.chevron_right, color: theme.dividerColor,)
              ],
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Row(
              children: <Widget>[
                Text("性别", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti")),
                Expanded(child: Container()),
                Text("男", style: TextStyle(fontSize: 14.0),),
                SizedBox(width: 8.0,),
                Icon(Icons.chevron_right, color: theme.dividerColor,)
              ],
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Row(
              children: <Widget>[
                Text("手机号", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti")),
                Expanded(child: Container()),
                Text("17051105693", style: TextStyle(fontSize: 14.0),),
                SizedBox(width: 8.0,),
                Icon(Icons.chevron_right, color: theme.dividerColor,)
              ],
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Row(
              children: <Widget>[
                Text("职业", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti")),
                Expanded(child: Container()),
                Text("装修公司设计", style: TextStyle(fontSize: 14.0),),
                SizedBox(width: 8.0,),
                Icon(Icons.chevron_right, color: theme.dividerColor,)
              ],
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Row(
              children: <Widget>[
                Text("爱好", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti")),
                Expanded(child: Container()),
                Text("羽毛球，乒乓球", style: TextStyle(fontSize: 14.0),),
                SizedBox(width: 8.0,),
                Icon(Icons.chevron_right, color: theme.dividerColor,)
              ],
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Row(
              children: <Widget>[
                Text("家乡", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti")),
                Expanded(child: Container()),
                Text("四川省成都市", style: TextStyle(fontSize: 14.0),),
                SizedBox(width: 8.0,),
                Icon(Icons.chevron_right, color: theme.dividerColor,)
              ],
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Row(
              children: <Widget>[
                Text("个性签名", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "kaiti")),
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 3,
                  child: Text("需要很长很长很长很长很长很长很长的一段话才能介绍自己", overflow: TextOverflow.ellipsis,),
                ),
                Icon(Icons.chevron_right, color: theme.dividerColor,)
              ],
            ),
          )
        ]
      )
    );
  }

}