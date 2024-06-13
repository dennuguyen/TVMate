import 'dart:ui';
import 'dart:math';

import 'package:tvmate/src/draggable_canvas/draggable_shape.dart';

class DraggableRectangle extends DraggableShape {
  final double width;
  final double height;

  DraggableRectangle({
    required super.position,
    required super.color,
    required super.angle,
    required super.scale,
    required this.width,
    required this.height,
  });

  @override
  void draw(Canvas canvas) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.save();
    // Translate to center the shape.
    canvas.translate(position.dx, position.dy);
    canvas.rotate(angle);
    canvas.scale(scale);
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset.zero,
        width: width,
        height: height,
      ),
      paint,
    );
    canvas.restore();
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
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  DraggableShape fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
