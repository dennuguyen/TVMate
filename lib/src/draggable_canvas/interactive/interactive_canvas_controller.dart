import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/canvas/raw_canvas_controller.dart';
import 'package:tvmate/src/draggable_canvas/interactive/interactable.dart';
import 'package:tvmate/src/draggable_canvas/interactive/interactive_item.dart';

class InteractiveCanvasController extends RawCanvasController
    implements Interactable {
  // final HashMap<CustomPainter, Interactable> interactables = HashMap();
  final List<InteractiveItem> interactables = [];

  InteractiveCanvasController({super.painters});

  void onAcceptWithDetails(DragTargetDetails<InteractiveItem> details) {
    details.data.position = details.offset;
    interactables.add(details.data);

    // painter.addListener(this.onScaleUpdate);
    super.painters.add(details.data);
    notifyListeners();
  }

  @override
  void onScaleStart(ScaleStartDetails details) {
    for (final interactable in interactables) {
      if (interactable.contains(details.localFocalPoint)) {
        interactable.onScaleStart(details);
        notifyListeners();
        break;
      }
    }
  }

  @override
  void onScaleUpdate(ScaleUpdateDetails details) {
    // Ask the raw canvas to rebuild here.
    for (final interactable in interactables) {
      if (interactable.contains(details.localFocalPoint)) {
        interactable.onScaleUpdate(details);
        notifyListeners();
        break;
      }
    }
  }

  @override
  void onScaleEnd(ScaleEndDetails details) {
    for (final interactable in interactables) {
      interactable.onScaleEnd(details);
      notifyListeners();
    }
  }

  @override
  bool contains(Offset point) {
    throw UnimplementedError();
  }
}
