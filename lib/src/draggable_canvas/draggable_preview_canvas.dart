import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/draggable_preview_painter.dart';
import 'package:tvmate/src/draggable_canvas/draggable_shape.dart';

class DraggableShapePreview extends StatelessWidget {
  final DraggableShape shape;

  const DraggableShapePreview({super.key, required this.shape});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DraggablePreviewPainter(shape),
      size: const Size(100, 100),
    );
  }
}
