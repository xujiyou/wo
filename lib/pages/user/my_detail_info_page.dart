import 'package:flutter/material.dart';

class MyDetailInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDetailInfoPageState();
}

class _MyDetailInfoPageState extends State<MyDetailInfoPage> {

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
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.only(right: 16.0),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: theme.accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: Text("编辑", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                CircleAvatar(
                  radius: 36.0,
                  backgroundColor: theme.primaryColor,
                  child: FlutterLogo(),
                ),
                SizedBox(height: 8.0),
                Text("金三胖", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, fontFamily: "kaiti")),
                SizedBox(height: 4.0),
                Text("很想用一句话来描述自己", style: TextStyle(fontSize: 14.0),),
                SizedBox(height: 20.0,),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            color: theme.accentColor,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0))
                          ),
                          child: Column(
                            children: <Widget>[
                              Text("100", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: theme.cardColor),),
                              SizedBox(height: 2.0,),
                              Text("积分", style: TextStyle(fontSize: 12.0, color: theme.cardColor),)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                              color: theme.primaryColor.withOpacity(0.8),
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0))
                          ),
                          child: Column(
                            children: <Widget>[
                              Text("25", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: theme.cardColor),),
                              SizedBox(height: 2.0,),
                              Text("加入社区时长(天)", style: TextStyle(fontSize: 12.0, color: theme.cardColor),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 12.0,),
                      Icon(Icons.view_compact, color: theme.dividerColor, size: 20.0,),
                      SizedBox(width: 20.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("门牌号", style: TextStyle(color: theme.dividerColor, fontSize: 12.0)),
                          SizedBox(height: 4.0,),
                          Text("1-3-501", style: TextStyle(fontSize: 16.0),)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 12.0,),
                      Icon(Icons.phone_iphone, color: theme.dividerColor, size: 20.0,),
                      SizedBox(width: 20.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("手机号", style: TextStyle(color: theme.dividerColor, fontSize: 12.0)),
                          SizedBox(height: 4.0,),
                          Text("11011010000", style: TextStyle(fontSize: 16.0),)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 12.0,),
                      Icon(Icons.label_outline, color: theme.dividerColor, size: 20.0,),
                      SizedBox(width: 20.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("职业", style: TextStyle(color: theme.dividerColor, fontSize: 12.0)),
                          SizedBox(height: 4.0,),
                          Text("装修公司设计", style: TextStyle(fontSize: 16.0),)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 12.0,),
                      Icon(Icons.all_inclusive, color: theme.dividerColor, size: 20.0,),
                      SizedBox(width: 20.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("兴趣", style: TextStyle(color: theme.dividerColor, fontSize: 12.0)),
                          SizedBox(height: 4.0,),
                          Text("羽毛球，兵乓球", style: TextStyle(fontSize: 16.0),)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 12.0,),
                      Icon(Icons.home, color: theme.dividerColor, size: 20.0,),
                      SizedBox(width: 20.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("家乡", style: TextStyle(color: theme.dividerColor, fontSize: 12.0)),
                          SizedBox(height: 4.0,),
                          Text("四川省成都市", style: TextStyle(fontSize: 16.0),)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

}