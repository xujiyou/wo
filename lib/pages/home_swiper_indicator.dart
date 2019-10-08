import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//底部导航栏
class HomeSwiperIndicator extends SwiperIndicator {
  HomeSwiperIndicator(this.swiperController);
  final SwiperController swiperController;
  List<BarItem> barItemList = [
    BarItem("首页", FontAwesomeIcons.home),
    BarItem("服务", FontAwesomeIcons.servicestack),
    BarItem("动态", FontAwesomeIcons.heartbeat),
    BarItem("邻居", FontAwesomeIcons.doorOpen),
    BarItem("我的", FontAwesomeIcons.solidUser),
  ];

  @override
  Widget build(BuildContext context, int index, int itemCount) {
    ThemeData theme = Theme.of(context);

    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: theme.cardColor,
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: const Color(0x0e000000),
              offset: new Offset(0.0, 1.0),
              blurRadius: 1.0,
              spreadRadius: 0.0),
          new BoxShadow(
              color: const Color(0x0c000000),
              offset: new Offset(0.0, 1.0),
              blurRadius: 1.0,
              spreadRadius: -1.0),
          new BoxShadow(
              color: const Color(0x15000000),
              offset: new Offset(0.0, 1.0),
              blurRadius: 1.0,
              spreadRadius: 0.0),
        ]
      ),
      child: Row(
        children: List.generate(itemCount, (_index) {
          Color barColor = theme.textTheme.body1.color.withOpacity(0.5);
          if (_index == index) barColor = theme.accentColor;

          return Expanded(
            child: FlatButton(
              onPressed: () {
                SystemSound.play(SystemSoundType.click);
                swiperController.animateToPage(_index, duration: Duration(milliseconds: 300), curve: Curves.linear);
              },
              padding: EdgeInsets.zero,
              child: Container(
                height: kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(barItemList[_index].icon, size: 16.0, color: barColor),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(barItemList[_index].name, style: TextStyle(color: barColor, fontSize: 12.0, fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

}

class BarItem {
  String name;
  IconData icon;
  BarItem(this.name, this.icon);
}