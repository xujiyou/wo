import 'package:flutter/widgets.dart';
import 'package:linli/pages/user_home_page.dart';

class Router {
  static Map<String, WidgetBuilder> routes = {
    "/": (buildContext) => UserHomePage()
  };
}