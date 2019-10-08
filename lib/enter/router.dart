import 'package:flutter/widgets.dart';
import 'package:linli/pages/tourist/tourist_home_page.dart';
import 'package:linli/pages/user/user_home_page.dart';

class Router {

  static Map<String, WidgetBuilder> _userHomePages = {
    "/": (context) => UserHomePage()
  };

  static Map<String, WidgetBuilder> _touristHomePages = {
    "/tourist/home": (context) => TouristHomePage()
  };

  static Map<String, WidgetBuilder> getRoutes() {
    Map<String, WidgetBuilder> routes = {};
    routes.addAll(_userHomePages);
    routes.addAll(_touristHomePages);
    return routes;
  }
}