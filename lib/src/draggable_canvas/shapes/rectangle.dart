import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/interactive/interactive_item.dart';

class Rectangle extends InteractiveItem {
  double width;
  double height;

  @override
  double angle;

  @override
  Offset position;

  @override
  double scale;

  @override
  Paint style;

  Rectangle({
    required this.width,
    required this.height,
    required this.position,
    required this.style,
    required this.angle,
    required this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(position.dx, position.dy);
    canvas.rotate(angle);
    canvas.scale(scale);
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset.zero,
        width: width,
        height: height,
      ),
      style,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool contains(Offset point) {
    final scaledWidth = width * scale;
    final scaledHeight = height * scale;
    final rect = Rect.fromCenter(
      center: position,
      width: scaledWidth,
      height: scaledHeight,
    );
    return _isPointInRotatedRect(point, rect, angle);
  }

  bool _isPointInRotatedRect(Offset point, Rect rect, double angle) {
    // Translate point to origin
    Offset originPoint = point - rect.center;

    // Rotate point in opposite direction of rectangle's rotation
    double cosAngle = cos(-angle);
    double sinAngle = sin(-angle);
    double xNew = originPoint.dx * cosAngle - originPoint.dy * sinAngle;
    double yNew = originPoint.dx * sinAngle + originPoint.dy * cosAngle;
    Offset rotatedPoint = Offset(xNew, yNew) + rect.center;

    // Check if point is within rectangle bounds
    return rect.contains(rotatedPoint);
  }

  @override
  void onScaleEnd(ScaleEndDetails details) {}

  @override
  void onScaleStart(ScaleStartDetails details) {}

  @override
  void onScaleUpdate(ScaleUpdateDetails details) {
    position = details.localFocalPoint;
    angle += details.rotation;
    scale *= details.scale;
  }

  @override
  Widget toWidget({Size size = Size.zero, Widget? child}) {
    return CustomPaint(painter: this, size: size, child: child);
  }
}
