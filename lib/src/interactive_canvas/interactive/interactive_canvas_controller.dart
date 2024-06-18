import 'package:flutter/material.dart';
import 'package:tvmate/src/interactive_canvas/canvas/raw_canvas_controller.dart';
import 'package:tvmate/src/interactive_canvas/interactive/interactable.dart';
import 'package:tvmate/src/interactive_canvas/interactive/interactive_item.dart';

class InteractiveCanvasController extends RawCanvasController
    implements Interactable {
  final List<InteractiveItem> interactables = [];

  InteractiveCanvasController({super.painters});

  void onAcceptWithDetails(DragTargetDetails<InteractiveItem> details) {
    InteractiveItem temp = details.data.copy() as InteractiveItem;
    temp.position = details.offset;
    interactables.add(temp);
    super.add(temp);
    notifyListeners();
  }

  @override
  void onScaleStart(ScaleStartDetails details) {
    for (final interactable in interactables) {
      // TODO: overlapping shapes interfere.
      if (interactable.contains(details.localFocalPoint)) {
        interactable.onScaleStart(details);
        notifyListeners();
        break;
      }
    }
  }

  @override
  void onScaleUpdate(ScaleUpdateDetails details) {
    // TODO: items are only draggable as long as the mouse is in-bounds. bad UX
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
