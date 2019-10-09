import 'package:flutter/material.dart';

class NoticeWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NoticeWidgetState();

}

class _NoticeWidgetState extends State<NoticeWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      padding: EdgeInsets.all(12.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 16.0,
                backgroundColor: theme.primaryColor,
                child: FlutterLogo(),
              ),
              SizedBox(width: 8.0),
              Text("邻里社区"),
              Expanded(child: Container(),),
            ],
          ),
          SizedBox(height: 12.0),
          Container(
            child: Text(
              "停电公告---东奥路区域停电检修：尊敬的客户，今07:30至20:00，您户所在的10KV东奥路区域停电检修工作，现因故将延迟大约至23:00恢复供电。由此带来的不便，深表歉意，敬请谅解。",
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 12.0),
          Row(
            children: <Widget>[
              Text("2019-10-10", style: TextStyle(color: theme.dividerColor, fontSize: 12.0),),
              Expanded(child: Container(),),
              Icon(Icons.more_horiz)
            ],
          )
        ],
      ),
    );
  }

}