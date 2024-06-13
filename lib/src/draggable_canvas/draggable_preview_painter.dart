import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/draggable_shape.dart';

class DraggablePreviewPainter extends CustomPainter {
  final DraggableShape shape;

  DraggablePreviewPainter(this.shape);

  @override
  void paint(Canvas canvas, Size size) {
    // Translate to center the shape.
    canvas.translate(size.width / 2, size.height / 2);
    shape.draw(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
