import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/draggable_rectangle.dart';
import 'package:tvmate/src/draggable_canvas/draggable_shape.dart';
import 'package:tvmate/src/draggable_canvas/draggable_preview_canvas.dart';

class DraggableShapeLibrary extends StatelessWidget {
  final List<DraggableShape> libraryShapes = [
    DraggableRectangle(
      position: Offset.zero,
      width: 100,
      height: 50,
      color: Colors.blue,
      angle: 0.0,
      scale: 1.0,
    ),
    // Add more shapes as needed
  ];

  DraggableShapeLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: libraryShapes.map((shape) {
        return Draggable(
          data: shape,
          feedback: DraggableShapePreview(shape: shape),
          child: DraggableShapePreview(shape: shape),
        );
      }).toList(),
    );
  }
}
