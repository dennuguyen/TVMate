import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/draggable_rectangle.dart';
import 'package:tvmate/src/draggable_canvas/draggable_shape.dart';
import 'package:tvmate/src/draggable_canvas/draggable_preview_canvas.dart';

class DraggablePreviewList extends StatelessWidget {
  final List<DraggableShape> libraryShapes = [
    DraggableRectangle(
      position: Offset.zero,
      width: 50,
      height: 50,
      color: Colors.blue,
      angle: 0.0,
      scale: 1.0,
    ),
    DraggableRectangle(
      position: Offset.zero,
      width: 50,
      height: 50,
      color: Colors.green,
      angle: 0.0,
      scale: 1.0,
    ),
  ];

  DraggablePreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: libraryShapes.length,
        itemBuilder: (context, index) {
          final shape = libraryShapes[index];
          // Row is required to center horizontally.
          return Row(
            children: [
              Draggable(
                data: shape,
                feedback: DraggablePreviewCanvas(shape: shape),
                child: DraggablePreviewCanvas(shape: shape),
              ),
            ],
          );
        },
      ),
    );
  }
}
