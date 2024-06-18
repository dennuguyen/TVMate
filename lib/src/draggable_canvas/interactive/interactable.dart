import 'package:flutter/material.dart';

abstract interface class Interactable {
  void onScaleStart(ScaleStartDetails details);
  void onScaleUpdate(ScaleUpdateDetails details);
  void onScaleEnd(ScaleEndDetails details);
  bool contains(Offset point);
}
