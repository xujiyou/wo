import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:linli/enter/router.dart';
import 'package:linli/enter/theme.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "邻里",
      theme: LinliTheme.lightLinliTheme.data,
      routes: Router.routes,
      localizationsDelegates: [ //本地化支持
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English
        Locale('zh'), // 中文支持
      ],
    );
  }

}