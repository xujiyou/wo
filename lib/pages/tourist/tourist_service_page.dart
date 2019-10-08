import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TouristServicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristServicePageState();
}

class _TouristServicePageState extends State<TouristServicePage> {

  void viewHelp(String title, String content) {
    ThemeData theme = Theme.of(context);

    showDialog(context: context, builder: (c) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: Text(content),
        ),
        actions: <Widget>[
          FlatButton(
              child: Text("了解", style: TextStyle(color: theme.accentColor)),
              onPressed: () => Navigator.of(c).pop()
          )
        ],
      );
    });
  }

  Widget buildTag(String name, IconData icon, String routeName, String content, {BorderRadius borderRadius}) {
    ThemeData theme = Theme.of(context);
    Color circleBgColor = theme.backgroundColor;
    Color iconColor = theme.primaryColor;
    if (borderRadius == null) {
      borderRadius = BorderRadius.all(Radius.circular(0.0));
    }

    return InkWell(
      onTap: () {},
      borderRadius: borderRadius,
      child: Container(
        padding: EdgeInsets.only(left: 16.0, top: 12.0, bottom: 12.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: circleBgColor,
              radius: 20.0,
              child: Icon(icon, color: iconColor, size: 16.0,),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(name, style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
                child: IconButton(
                    icon: Icon(Icons.help_outline, color: theme.dividerColor, size: 18.0),
                    onPressed: () => viewHelp(name, content)
                )
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("社区服务"),
        ),
        body: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.only(top: 16.0, bottom: 24.0, right: 16.0, left: 16.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  buildTag("社区团购", FontAwesomeIcons.shoppingCart, "/groupBuying", cGroupBuyingRule,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(4.0), topLeft: Radius.circular(4.0))),
                  Divider(height: 1.0, color: theme.backgroundColor),
                  buildTag("社区周边", FontAwesomeIcons.solidCompass, "/around", "展示附近的店铺。"
                      "足不出户即可了解附近的商户"),
                  Divider(height: 1.0, color: theme.backgroundColor),
                  buildTag("周边出游", FontAwesomeIcons.shoePrints, "/travel", "展示附近的景点。\n"
                      "亲友，邻居，同事可以结伴出行"),
                  Divider(height: 1.0, color: theme.backgroundColor),
                  buildTag("免费工具", FontAwesomeIcons.wrench, "/tool", "生活中，我们有一些不常用但占地方的工具，比如梯子等。\n\n"
                      "我们可以在自己的小区展示分享这样的工具，方便邻居，也方便自己，还能增进邻里之间的感情。\n\n"
                      "除此之外，我们还自己购买了一批工具，不过只有靠近仓库的十几个小区能够看到并借用，我们未来会提供更多的工具。"),
                  Divider(height: 1.0, color: theme.backgroundColor),
                  buildTag("社区黄页", FontAwesomeIcons.solidPaperPlane, "/yellowPage", "社区黄页",
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(4.0), bottomLeft: Radius.circular(4.0))),
                ],
              ),
            ),
          ),
        )
    );
  }

}

final String cGroupBuyingRule = """## 社区团购

---

`社区团购`是专门针对小区居民提供的团购产品，价格一般远低于小区周边超市、小卖部等，且由平台审核产品来源，确保产品的品质。

### 社区团购特点

 1. 对一次团购，一户业主仅能`参加一次`；
 2. 拼团的户数越多，价格越便宜；
 3. 参团只付定金（拼团成功后最低价格的`10%`）；
 4. 只有达到最低团购户数，本次团购才会成功，若未成功，则将定金退回到您的微信中；
 5. 大部分团购产品拼团成功后，当天到货；
 6. 团购产品均送至小区（小区门口或其他地址，如菜鸟驿站等，见APP通知）；
 
---

## 其他

 - 若发现其他平台有比社区团购更低的价格，欢迎反馈，反馈电话：`18880442905`，`15528281876`
 - 若业主有更优质团购产品渠道，欢迎致电合作
 

---""";