import 'package:flutter/material.dart';
import 'package:tvmate/src/interactive_canvas/interactive/copyable.dart';
import 'package:tvmate/src/interactive_canvas/interactive/interactable.dart';
import 'package:tvmate/src/interactive_canvas/interactive/shapeable.dart';

abstract class InteractiveItem extends CustomPainter
    implements Interactable, Shapeable, Copyable {
  late double _initialAngle = 0.0;
  late double _initialScale = 1.0;
  bool selected = false;

  @override
  void onScaleStart(ScaleStartDetails details) {
    if (contains(details.localFocalPoint)) {
      selected = true;
      _initialAngle = angle;
      _initialScale = scale;
    }
  }

  @override
  void onScaleUpdate(ScaleUpdateDetails details) {
    if (selected == true) {
      position = details.localFocalPoint;
      angle = details.rotation + _initialAngle;
      scale = details.scale * _initialScale;
    }
  }

  @override
  void onScaleEnd(ScaleEndDetails details) {
    selected = false;
    _initialAngle = 0.0;
    _initialScale = 1.0;
  }
}
