import 'package:flutter/material.dart';
import 'package:linli/pages/auth/auth_page.dart';
import 'package:linli/plugins/custom_space_bar.dart';
import 'package:linli/widgets/album_widget.dart';
import 'package:linli/widgets/ask_widget.dart';
import 'package:linli/widgets/clock_widget.dart';
import 'package:linli/widgets/notice_widget.dart';

class TouristAskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristAskPageState();
}

class _TouristAskPageState extends State<TouristAskPage>  with AutomaticKeepAliveClientMixin<TouristAskPage> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    snap: true,
                    expandedHeight: 180.0,
                    backgroundColor: theme.backgroundColor,
                    flexibleSpace: CustomSpaceBar(
                      title: Text("邻里动态", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, fontFamily: "kaiti", color: theme.primaryColor),),
                      bottom: Container(
                        padding: EdgeInsets.symmetric(),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (c) => AuthPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                            height: 40.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.all(Radius.circular(8.0))
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Icon(Icons.search),
                                ),
                                Text("搜索邻居、小区、拼车、招聘、寻租...")
                              ],
                            ),
                          ),
                        ),
                      ),
                      action: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (c) => AuthPage()));
                        },
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: theme.primaryColor,
                          child: Icon(Icons.person_outline, color: Colors.white,),
                        ),
                      )
                    ),
                  )
                ];
              },
              body: ListView(
                padding: EdgeInsets.only(bottom: kToolbarHeight + 20.0),
                children: <Widget>[
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
            ),
          ),


          Positioned(
            bottom: kToolbarHeight + 12,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => AuthPage()));
              },
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

  @override
  bool get wantKeepAlive => true;
}