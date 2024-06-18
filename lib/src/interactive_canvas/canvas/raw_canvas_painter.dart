import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tvmate/src/interactive_canvas/canvas/raw_canvas_controller.dart';

class RawCanvasPainter extends CustomPainter {
  final RawCanvasController controller;

  RawCanvasPainter({required this.controller});

  @override
  void paint(Canvas canvas, Size size) {
    for (final customPainter in controller.painters) {
      customPainter.paint(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
