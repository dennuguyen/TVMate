import 'package:flutter/material.dart';

abstract interface class Shapeable {
  late Paint style;
  late Offset position;
  late double angle; // radians
  late double scale;
  Widget toWidget({Size size = Size.zero, Widget? child});
}
