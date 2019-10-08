import 'package:flutter/material.dart';

class TouristHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristHomePageState();
}

class _TouristHomePageState extends State<TouristHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("游客"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pushNamed("/tourist/index"),
          child: Text("游客"),
        ),
      ),
    );
  }

}