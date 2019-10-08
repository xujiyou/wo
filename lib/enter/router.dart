import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linli/enter/home.dart';
import 'package:linli/pages/tourist/tourist_index_page.dart';
import 'package:linli/scoped_model/global_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Router {

  static final Widget home = ScopedModel<GlobalModel>(
    model: GlobalModel(),
    child: ScopedModelDescendant<GlobalModel>(
        builder: (buildContext, child, globalModel) {
          return Home();
        }
    ),
  );

  static Route<dynamic> buildRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/tourist/index":
        return MaterialPageRoute(builder: (context) => TouristIndexPage());
      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}