import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    int line = (MediaQuery.of(context).size.height * 0.32 / 20).floor();

    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
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
                  child: Text("反馈", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: "kaiti")),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.32,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: theme.dividerColor, width: 0.4),
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: TextField(
                controller: textEditingController,
                maxLines: line,
                cursorWidth: 1.0,
                cursorColor: theme.accentColor,
                style: TextStyle(height: 1.2, letterSpacing: 1.0, color: theme.textTheme.body1.color, fontSize: 14.0),
                focusNode: focusNode,
                decoration: InputDecoration.collapsed(
                    hintText: "写下你的建议...",
                    hintStyle: TextStyle(height: 1.2, letterSpacing: 1.0, color: theme.hintColor, fontSize: 14.0, fontFamily: "kaiti")),
              ),
            ),
            Container(
              width: double.infinity,
              height: 44.0,
              margin: EdgeInsets.symmetric(horizontal: 54.0),
              child: FlatButton(
                color: theme.accentColor,
                shape: StadiumBorder(),
                onPressed: () {},
                child: Text("反馈", style: TextStyle(color: Colors.white, fontFamily: "kaiti")),
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              alignment: Alignment.center,
              child: Text("感谢您对我们的支持!!!", style: TextStyle(color: theme.dividerColor, fontFamily: "kaiti")),
            )
          ]
        )
      ),
    );
  }

}