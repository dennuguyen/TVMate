import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/shapes/rectangle.dart';
import 'package:tvmate/src/draggable_canvas/interactive/shapeable.dart';

class PreviewList extends StatelessWidget {
  final List<Shapeable> painters = [
    Rectangle(
      position: Offset.zero,
      width: 50,
      height: 50,
      style: Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
      angle: 0.0,
      scale: 1.0,
    ),
  ];

  PreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 50),
        scrollDirection: Axis.horizontal,
        itemCount: painters.length,
        itemBuilder: (context, index) {
          final shape = painters[index];
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
              )),
              // TODO: refactor Draggable so it's cleaner to build custom menus.
              child: Draggable(
                data: shape,
                feedback: shape.toWidget(size: const Size.square(50)),
                child: shape.toWidget(size: const Size.square(50)),
              ),
            ),
          );
        },
      ),
    );
  }
}
