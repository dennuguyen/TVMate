import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/interactive/interactive_canvas_controller.dart';
import 'package:tvmate/src/draggable_canvas/canvas/raw_canvas.dart';
import 'package:tvmate/src/draggable_canvas/interactive/interactive_item.dart';

class InteractiveCanvas extends RawCanvas {
  @override
  // ignore: overridden_fields
  final InteractiveCanvasController controller = InteractiveCanvasController();

  InteractiveCanvas({
    super.key,
    super.size,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: GridPaper(
        color: Colors.black12,
        divisions: 1,
        subdivisions: 1,
        child: GestureDetector(
          onScaleStart: controller.onScaleStart,
          onScaleUpdate: controller.onScaleUpdate,
          onScaleEnd: controller.onScaleEnd,
          child: DragTarget<InteractiveItem>(
            onAcceptWithDetails: controller.onAcceptWithDetails,
            builder: (context, candidateData, rejectedData) {
              return super.build(context);
            },
          ),
        ),
      ),
    );
  }
}
