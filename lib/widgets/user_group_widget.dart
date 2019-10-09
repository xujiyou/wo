import 'package:flutter/material.dart';
import 'package:linli/widgets/user_widget.dart';

class UserGroupWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserGroupWidgetState();
}

class _UserGroupWidgetState extends State<UserGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            child: UserWidget()
          ),
          Positioned(
            top: 40.0,
            child: Card(
              child: UserWidget()
            ),
          )
        ],
      ),
    );
  }

}