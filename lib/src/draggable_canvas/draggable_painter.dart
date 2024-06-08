import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/draggable_shape.dart';

class DraggablePainter extends CustomPainter {
  final List<DraggableShape> shapes;
  DraggableShape? selectedShape;

  DraggablePainter(this.shapes, this.selectedShape);

  @override
  void paint(Canvas canvas, Size size) {
    for (final shape in shapes) {
      shape.draw(canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}