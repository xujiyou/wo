import 'package:flutter/material.dart';

class TouristUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristUserPageState();
}

class _TouristUserPageState extends State<TouristUserPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("TouristUserPage"),
      ),
    );
  }
}