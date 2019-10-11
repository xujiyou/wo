import 'package:flutter/material.dart';
import 'package:linli/plugins/flip_card_widget.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double cardHeight = (MediaQuery.of(context).size.width - 32.0) * 0.618;

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
                child: Text("关于", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,  fontFamily: "kaiti")),
              )
            ],
          ),
          SizedBox(height: 60.0),
          Container(
            margin: EdgeInsets.only(bottom: 12.0),
            child: FlipCardWidget(
              frontWidget: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  height: cardHeight,
                  decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 32.0,),
                          Text("邻里社区", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                          SizedBox(width: 12.0,),
                          Container(
                            width: 0.4,
                            height: 40.0,
                            color: theme.textTheme.body1.color,
                          ),
                          SizedBox(width: 12.0,),
                          Text("发现你的邻居"),
                          Expanded(child: Container())
                        ],
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Container()
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("成都维度视野科技有限公司", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 8.0),
                                    Text("联系方式：1101101110", style: TextStyle()),
                                    Text("邮箱：x110110110", style: TextStyle()),
                                    Text("网址：https://www.linli.tech", style: TextStyle()),
                                  ],
                                ),
                              )
                          )
                        ],
                      )
                    ],
                  )
              ),
              backWidget: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  height: cardHeight,
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.business, color: Colors.white, size: 56.0,),
                      SizedBox(width: 6.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("邻里社区", style: TextStyle(color: Colors.white, fontSize: 18.0)),
                          SizedBox(height: 2.0),
                          Text("https://www.linli.tech", style: TextStyle(color: Colors.white, fontSize: 10.0)),
                        ],
                      )
                    ],
                  )
              ),
            ),
          )
        ],
      ),
    );
  }

}
