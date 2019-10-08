import 'package:flutter/material.dart';

class LinliThemeData {
  LinliThemeData(this.name, this.data);

  final String name;
  final ThemeData data;
}

class LinliTheme {

  static final LinliThemeData lightLinliTheme = LinliThemeData('Light', _buildLightTheme());

  static final LinliThemeData darkLinliTheme = LinliThemeData("Dark", _buildDarkTheme());

  static ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
        primaryColor: Color(0xFF202d40),
        indicatorColor: Colors.white,
        disabledColor: Color(0xFF38D3CD).withOpacity(0.4), // 取
        dividerColor: Color(0xFF999999), // 分割线的颜色
        hintColor: Colors.black45,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        backgroundColor: Color(0xFFF5F5F5),
        accentColor: Color(0xFF38D3CD));
  }

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      primaryColorBrightness: Brightness.dark,
      primaryColor: Color(0xFFF2EAED),
      dividerColor: base.textTheme.body1.color.withOpacity(0.2),
    );
  }
}