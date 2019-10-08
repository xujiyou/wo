import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:linli/pages/user_home_page.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "邻里",
     // theme: model.option.theme.data, //定义主题
     // onGenerateRoute: Application.router.generator, //定义路由
      routes: {
        "/": (buildContext) => UserHomePage()
      },
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