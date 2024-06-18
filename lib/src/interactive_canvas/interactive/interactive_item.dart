import 'package:flutter/material.dart';
import 'package:tvmate/src/interactive_canvas/interactive/copyable.dart';
import 'package:tvmate/src/interactive_canvas/interactive/interactable.dart';
import 'package:tvmate/src/interactive_canvas/interactive/shapeable.dart';

abstract class InteractiveItem extends CustomPainter
    implements Interactable, Shapeable, Copyable {
  late double _initialAngle;
  late double _initialScale;

  @override
  void onScaleStart(ScaleStartDetails details) {
    if (contains(details.localFocalPoint)) {
      _initialAngle = angle;
      _initialScale = scale;
    }
  }

  @override
  void onScaleUpdate(ScaleUpdateDetails details) {
    position = details.localFocalPoint;
    angle = details.rotation + _initialAngle;
    scale = details.scale * _initialScale;
  }

  @override
  void onScaleEnd(ScaleEndDetails details) {
    _initialAngle = 0.0;
    _initialScale = 1.0;
  }
}
