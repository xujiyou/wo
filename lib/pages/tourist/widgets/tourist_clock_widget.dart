import 'package:flutter/material.dart';
import 'package:linli/pages/auth/auth_page.dart';

class TouristClockWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristClockWidgetState();
}

class _TouristClockWidgetState extends State<TouristClockWidget> {

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
                Text("李四"),
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
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "签到：又是充满鸡血的一天   ",
                  style: TextStyle(color: theme.textTheme.body1.color),
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.location_on, color: theme.accentColor, size: 18.0,)
                    ),
                    TextSpan(
                      text: "金融城",
                      style: TextStyle(color: theme.accentColor),
                    )
                  ]
                )
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              children: <Widget>[
                Text("4小时前", style: TextStyle(color: theme.dividerColor, fontSize: 12.0),),
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