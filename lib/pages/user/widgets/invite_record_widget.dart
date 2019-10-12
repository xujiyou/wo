import 'package:flutter/material.dart';

class InviteRecordWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InviteRecordWidgetState();
}

class _InviteRecordWidgetState extends State<InviteRecordWidget> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 4.0),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            child: InkWell(
              onTap: () {

              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text("邀请码（点击复制）：", style: TextStyle(color: theme.dividerColor, fontSize: 14.0)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6.0, bottom: 16.0),
                            child: Text("123456", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: theme.accentColor),),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6.0),
                            child: Text(
                              DateTime.now().toString().substring(0, 16),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  Text("邀请"),
                                  Text(
                                    " 1-3-501 ",
                                    style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold),
                                  ),
                                  Text(" 加入")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 0.6,
                      height: 60.0,
                      child: Container(color: theme.dividerColor),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Text("暂", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold)),
                            Text("未", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold)),
                            Text("加", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold)),
                            Text("入", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            shape: CircleBorder(),
            margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width - 64.0) * 0.5),
            child: CircleAvatar(
              radius: 18.0,
              backgroundColor: theme.primaryColor,
              child: Icon(Icons.share, color: theme.cardColor, size: 22.0),
            ),
          ),
        )
      ],
    );
  }

}