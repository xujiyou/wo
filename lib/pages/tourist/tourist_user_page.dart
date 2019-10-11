import 'package:flutter/material.dart';
import 'package:linli/pages/auth/auth_page.dart';
import 'package:linli/widgets/user_info_widget.dart';

class TouristUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristUserPageState();
}

class _TouristUserPageState extends State<TouristUserPage> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(bottom: kToolbarHeight + 20.0),
              children: <Widget>[
                SizedBox(height: 60.0,),
                Container(
                  padding: EdgeInsets.only(top: 6.0, bottom: 12.0),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  child: Text("邻里社区 · 邻居", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                ),
                SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(

                        children: <Widget>[
                          UserInfoWidget(),
                          UserInfoWidget(),
                          UserInfoWidget(),
                          UserInfoWidget(),
                          UserInfoWidget(),
                          UserInfoWidget()
                        ],
                      ),
                    ),
                    SizedBox(width: 64.0),
                  ],
                )
              ],
            ),
            Positioned(
              top: 124.0,
              child: Container(
                width: 64.0,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: (kToolbarHeight + 20.0) * 3, top: 6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("栋"),
                      for (int i = 1; i < 22; i++)
                        FlatButton(
                          color: theme.cardColor,
                          padding: EdgeInsets.zero,
                          shape: CircleBorder(),
                          onPressed: () {},
                          child: Text(i.toString(), style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}