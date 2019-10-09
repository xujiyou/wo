import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:linli/pages/home_swiper_indicator.dart';
import 'package:linli/pages/tourist/tourist_ask_page.dart';
import 'package:linli/pages/tourist/tourist_index_page.dart';
import 'package:linli/pages/tourist/tourist_service_page.dart';
import 'package:linli/pages/tourist/tourist_user_page.dart';
import 'package:linli/pages/tourist/tourist_zone_page.dart';

class TouristHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristHomePageState();
}

class _TouristHomePageState extends State<TouristHomePage> {
  SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Swiper(
            indicator: HomeSwiperIndicator(swiperController),
            controller: swiperController,
            autoStart: false,
            children: [
//              TouristIndexPage(),
//              TouristServicePage(),
              TouristAskPage(),
              TouristUserPage(),
              TouristZonePage(),
            ]
        )
    );
  }

}