import 'package:flutter/material.dart';

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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Text("登录后查看邻居", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {},
                  color: theme.cardColor,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Text("立即登录", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(

                      ),
                    ),
                    Expanded(
                      child: Container(

                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}