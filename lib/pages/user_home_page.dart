import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:linli/pages/home_swiper_indicator.dart';
import 'package:linli/pages/user/user_ask_page.dart';
import 'package:linli/pages/user/user_list_page.dart';
import 'package:linli/pages/user/user_zone_page.dart';

class UserHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  SwiperController swiperController = SwiperController();

//  void logout() {
//    SharedPreferencesUtil.handleCache((prefs) {
//      prefs.setString("token", "");
//      prefs.setString("id", "");
//      globalModel.judgeLogin();
//    });
//  }

  @override
  Widget build(BuildContext context) {

    //修改了官方代码： PageView -> cacheExtent
    return Scaffold(
        body: Swiper(
            indicator: HomeSwiperIndicator(swiperController),
            controller: swiperController,
            autoStart: false,
            children: [
              UserAskPage(),
              UserListPage(),
              UserZonePage(),
            ]
        )
    );
  }

}