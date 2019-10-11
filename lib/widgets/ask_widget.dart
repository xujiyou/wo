import 'package:flutter/material.dart';
import 'package:linli/pages/auth/auth_page.dart';

class AskWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AskWidgetState();
}

class _AskWidgetState extends State<AskWidget> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (c) => AuthPage()));
      },
      child: Container(
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
                Text("张三"),
                Expanded(child: Container(),),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on, size: 16.0, color: theme.dividerColor,),
                    SizedBox(width: 2.0),
                    Text("成都 · 国韵村", style: TextStyle(color: theme.dividerColor, fontSize: 12.0),)
                  ],
                )
              ],
            ),
            SizedBox(height: 12.0),
            Container(
              child: Text(
                "gRPC 是一个高性能、开源和通用的 RPC 框架，面向移动和 HTTP/2 设计，基于protobuf 3.x，基于Netty 4.x +。目前提供 C、Java 和 Go 语言版本",
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              children: <Widget>[
                Text("3小时前", style: TextStyle(color: theme.dividerColor, fontSize: 12.0),),
                Expanded(child: Container(),),
                Icon(Icons.more_horiz)
              ],
            )
          ],
        ),
      ),
    );
  }

}