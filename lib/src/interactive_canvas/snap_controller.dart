import 'package:flutter/material.dart';

class SnapController extends ChangeNotifier {
  Offset _position = Offset.zero;

  Offset get position => _position;

  void set(Offset newPosition) {
    double snappedX = (newPosition.dx / 50).round() * 50;
    double snappedY = (newPosition.dy / 50).round() * 50;
    _position = Offset(snappedX, snappedY);
    notifyListeners();
  }
}
