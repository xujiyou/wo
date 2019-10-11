import 'package:flutter/material.dart';
import 'package:linli/pages/auth/auth_page.dart';

class AlbumWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
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
                Text("王二麻子"),
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
                "相册：国庆成都七日游",
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 12.0),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: theme.primaryColor,
                        child: FlutterLogo(size: 80.0),
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Container(
                        color: theme.primaryColor,
                        child: FlutterLogo(size: 80.0),
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Container(
                        color: theme.primaryColor,
                        child: FlutterLogo(size: 80.0),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: theme.primaryColor,
                        child: FlutterLogo(size: 80.0),
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Container(
                        color: theme.primaryColor,
                        child: FlutterLogo(size: 80.0),
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Container(
                        color: theme.primaryColor,
                        child: FlutterLogo(size: 80.0),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: theme.primaryColor,
                        child: FlutterLogo(size: 80.0),
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Container(
                        color: theme.primaryColor,
                        child: FlutterLogo(size: 80.0),
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Container(
                        color: theme.primaryColor,
                        child: FlutterLogo(size: 80.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              children: <Widget>[
                Text("5小时前", style: TextStyle(color: theme.dividerColor, fontSize: 12.0),),
                Expanded(child: Container(),),
                Icon(Icons.more_horiz)
              ],
            ),
          ],
        ),
      ),
    );
  }

}