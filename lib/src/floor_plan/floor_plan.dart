import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/draggable_canvas.dart';
import 'package:tvmate/src/draggable_canvas/draggable_preview_list.dart';

class FloorPlan extends StatelessWidget {
  // Map<String, _> floorPlan;

  const FloorPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DraggableCanvas(),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DraggablePreviewList(),
          ),
        ),
      ],
    );
  }
}
