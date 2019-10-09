import 'package:flutter/material.dart';
import 'package:linli/widgets/album_widget.dart';
import 'package:linli/widgets/ask_widget.dart';
import 'package:linli/widgets/clock_widget.dart';
import 'package:linli/widgets/notice_widget.dart';

class TouristAskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristAskPageState();
}

class _TouristAskPageState extends State<TouristAskPage> {

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
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Row(
                  children: <Widget>[
                    Text("邻里动态", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
                    Expanded(child: Container(),),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: theme.primaryColor,
                      child: FlutterLogo(),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                height: 42.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.search),
                    ),
                    Text("搜索公告、动态、相册、博客")
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              AskWidget(),
              ClockWidget(),
              AlbumWidget(),
              NoticeWidget(),
              AskWidget(),
              ClockWidget(),
              AlbumWidget(),
              NoticeWidget()
            ],
          ),

          Positioned(
            bottom: kToolbarHeight + 12,
            child: RaisedButton(
              onPressed: () {},
              shape: CircleBorder(),
              color: theme.primaryColor,
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.add, color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }

}