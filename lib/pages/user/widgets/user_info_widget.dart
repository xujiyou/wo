import 'package:flutter/material.dart';

class UserInfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserInfoWidgetState();

}

class _UserInfoWidgetState extends State<UserInfoWidget> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 16.0),
      decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 24.0,
            backgroundColor: theme.primaryColor,
            child: Icon(Icons.person_outline, color: Colors.white, size: 24.0,),
          ),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("王二", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, fontFamily: "kaiti")),
              SizedBox(height: 2.0),
              Text("一句话很难介绍自己", style: TextStyle(fontSize: 12.0),)
            ],
          )
        ],
      ),
    );
  }

}