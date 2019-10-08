import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("邻里"),
      ),
      body: Center(
        child: Text("邻里"),
      ),
    );
  }

}