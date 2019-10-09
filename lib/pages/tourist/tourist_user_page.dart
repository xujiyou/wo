import 'package:flutter/material.dart';
import 'package:linli/widgets/user_group_widget.dart';
import 'package:linli/widgets/user_widget.dart';

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
        body: ListView(
          padding: EdgeInsets.only(bottom: kToolbarHeight + 20.0),
          children: <Widget>[
            SizedBox(height: 60.0,),
            Container(
              padding: EdgeInsets.only(top: 6.0, bottom: 12.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: theme.dividerColor, width: 0.4))
              ),
              child: Row(
                children: <Widget>[
                  Text("邻居", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
                  Expanded(child: Container(),),
                  FlatButton(
                    color: theme.primaryColor,
                    onPressed: () {},
                    child: Text("分组", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            UserWidget(),
            UserWidget(),
            UserWidget()
          ],
        ),
    );
  }
}