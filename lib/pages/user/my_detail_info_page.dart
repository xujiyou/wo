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
              SizedBox(width: 12.0),
              Container(
                child: Text("个人资料", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,  fontFamily: "kaiti")),
              )
            ],
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

}