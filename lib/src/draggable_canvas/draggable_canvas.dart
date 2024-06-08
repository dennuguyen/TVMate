import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/draggable_painter.dart';
import 'package:tvmate/src/draggable_canvas/draggable_shape.dart';
import 'package:tvmate/src/draggable_canvas/draggable_shape_library.dart';

class DraggableCanvas extends StatefulWidget {
  const DraggableCanvas({super.key});

  @override
  State<StatefulWidget> createState() => _DraggableCanvas();
}

class _DraggableCanvas extends State<DraggableCanvas> {
  List<DraggableShape> shapes = [];
  DraggableShape? _draggedShape;
  late double _initialAngle;
  late double _initialScale;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onScaleStart: _onScaleStart,
          onScaleUpdate: _onScaleUpdate,
          onScaleEnd: _onScaleEnd,
          child: DragTarget<DraggableShape>(
            onAcceptWithDetails: (details) {
              setState(() {
                shapes.add(details.data);
              });
            },
            builder: (context, candidateData, rejectedData) {
              return CustomPaint(
                size: const Size(double.infinity, double.infinity),
                painter: DraggablePainter(shapes, _draggedShape),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: DraggableShapeLibrary(),
        )
      ],
    );
  }

  void _onScaleStart(ScaleStartDetails details) {
    for (final shape in shapes) {
      if (shape.contains(details.localFocalPoint)) {
        _draggedShape = shape;
        _initialAngle = shape.angle;
        _initialScale = shape.scale;
        break;
      }
    }
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    if (_draggedShape != null) {
      setState(() {
        _draggedShape!.position = details.localFocalPoint;
        _draggedShape!.angle = details.rotation + _initialAngle;
        _draggedShape!.scale = details.scale * _initialScale;
      });
    }
  }

  void _onScaleEnd(ScaleEndDetails details) {
    // if (details.pointerCount == 1) {
    _draggedShape = null;
    // }
  }
}
