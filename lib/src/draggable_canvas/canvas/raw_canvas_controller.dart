import 'package:flutter/material.dart';

class RawCanvasController<T extends CustomPainter> extends ChangeNotifier {
  final List<T> painters;

  RawCanvasController({List<T>? painters}) : painters = [...?painters];

  void add(T element) {
    painters.add(element);
    notifyListeners();
  }

  bool remove(T element) {
    bool success = painters.remove(element);
    notifyListeners();
    return success;
  }
}
