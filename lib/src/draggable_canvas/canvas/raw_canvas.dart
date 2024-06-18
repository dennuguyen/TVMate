import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/canvas/raw_canvas_controller.dart';
import 'package:tvmate/src/draggable_canvas/canvas/raw_canvas_painter.dart';

class RawCanvas extends StatelessWidget {
  final RawCanvasController controller = RawCanvasController();
  final Size size;

  RawCanvas({
    super.key,
    this.size = const Size(double.infinity, double.infinity),
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          size: size,
          painter: RawCanvasPainter(controller: controller),
        );
      },
      listenable: controller,
    );
  }
}
