import 'dart:ui';

abstract class DraggableShape {
  Color color;
  Offset position;
  double angle; // radians
  double scale;

  DraggableShape({
    required this.position,
    required this.color,
    required this.angle,
    required this.scale,
  });

  void draw(Canvas canvas);
  bool contains(Offset point);

  Map<String, dynamic> toJson();
  DraggableShape fromJson(Map<String, dynamic> json);
}
