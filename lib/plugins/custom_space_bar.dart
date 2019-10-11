// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSpaceBar extends StatefulWidget {
  const CustomSpaceBar({
    Key key,
    this.title,
    this.bottom,
    this.action,
    this.centerTitle,
    this.collapseMode = CollapseMode.parallax,
  }) : assert(collapseMode != null),
        super(key: key);

  final Widget title;

  final Widget bottom;

  final Widget action;

  final bool centerTitle;

  final CollapseMode collapseMode;

  @override
  _CustomSpaceBarState createState() => _CustomSpaceBarState();
}

class _CustomSpaceBarState extends State<CustomSpaceBar> {

  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    switch (widget.collapseMode) {
      case CollapseMode.pin:
        return -(settings.maxExtent - settings.currentExtent);
      case CollapseMode.none:
        return 0.0;
      case CollapseMode.parallax:
        final double deltaExtent = settings.maxExtent - settings.minExtent;
        return -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final FlexibleSpaceBarSettings settings = context.inheritFromWidgetOfExactType(FlexibleSpaceBarSettings);
    assert(settings != null, 'A FlexibleSpaceBar must be wrapped in the widget returned by FlexibleSpaceBar.createSettings().');
    final List<Widget> children = <Widget>[];
    final double deltaExtent = settings.maxExtent - settings.minExtent;
    final double t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0);

    if (widget.title != null) {

      Widget title;
      switch (theme.platform) {
        case TargetPlatform.iOS:
          title = widget.title;
          break;
        case TargetPlatform.fuchsia:
        case TargetPlatform.android:
          title = Semantics(
            namesRoute: true,
            child: widget.title,
          );
      }

      final double opacity = settings.toolbarOpacity;
      if (opacity > 0.0) {
        final double scaleValue = Tween<double>(begin: 1.5, end: 1.0).transform(t);
        final Matrix4 scaleTransform = Matrix4.identity()..scale(scaleValue, scaleValue, 1.0);

        children.add(
          Container(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Transform(
              alignment: Alignment.bottomRight,
              transform: scaleTransform,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: title
              ),
            ),
          )
        );
      }
    }

    if (widget.bottom != null && widget.action != null) {
      final double fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
      const double fadeEnd = 0.72;
      assert(fadeStart <= fadeEnd);
      final double opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);
      if (opacity > 0.0) {
        children.add(Container(
          child: Opacity(
            opacity: opacity,
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topRight,
              children: <Widget>[
                widget.bottom,
                Positioned(
                  top: -52.0,
                  right: 16.0,
                  child: widget.action
                )
              ],
            )
          ),
        ));
      }
    }

    return ClipRect(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: children
      ),
    );
  }
}
