import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/interactive/interactive_canvas.dart';
import 'package:tvmate/src/floor_plan/preview_list.dart';

class FloorPlan extends StatelessWidget {
  // Map<String, _> remoteLocations;

  const FloorPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InteractiveCanvas(size: Size.infinite),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: PreviewList(),
          ),
        ),
      ],
    );
  }
}
