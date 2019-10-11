import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  OverlayEntry overlayEntry;
  final LayerLink layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
      this.overlayEntry = this.createOverlayEntry();
      Overlay.of(context).insert(this.overlayEntry);
    }));
  }

  OverlayEntry createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
          width: 40.0,
          height: 40.0,
          child: CompositedTransformFollower(
            link: this.layerLink,
            showWhenUnlinked: false,
            offset: Offset(size.width - 56.0, - 52.0),
            child: widget.action
          ),
        )
    );
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
            child: CompositedTransformTarget(
              link: this.layerLink,
              child: widget.bottom,
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
