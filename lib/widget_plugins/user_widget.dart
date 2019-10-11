import 'package:flutter/material.dart';
import 'package:linli/widget_plugins/flip_card_widget.dart';

class UserWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double cardHeight = (MediaQuery.of(context).size.width - 32.0) * 0.618;

    return Container(
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
                  Text("赵龙", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(width: 12.0,),
                  Container(
                    width: 0.4,
                    height: 40.0,
                    color: theme.textTheme.body1.color,
                  ),
                  SizedBox(width: 12.0,),
                  Text("首席设计（创始人）"),
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
                    flex: 2,
                    child: Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text("精铸装饰设计有限责任公司", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                           SizedBox(height: 8.0),
                           Text("联系方式：1101101110", style: TextStyle()),
                           Text("微信：x110110110", style: TextStyle()),
                           Text("地址：金融城", style: TextStyle()),
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
                    Text("精铸装饰", style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    SizedBox(height: 2.0),
                    Text("JING ZHU ZHUANG SHI", style: TextStyle(color: Colors.white, fontSize: 10.0)),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

}