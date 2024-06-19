import 'package:flutter/material.dart';
import 'package:tvmate/src/interactive_canvas/interactive/interactive_item.dart';
import 'package:tvmate/src/interactive_canvas/shapes/rectangle.dart';

class PreviewList extends StatelessWidget {
  final List<InteractiveItem> items = [
    Rectangle(
      position: const Offset(25, 25), // half of width and height to centre
      width: 50,
      height: 50,
      style: Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
      angle: 0.0,
      scale: 1.0,
    ),
    Rectangle(
      position: const Offset(25, 25), // half of width and height to centre
      width: 50,
      height: 50,
      style: Paint()
        ..color = Colors.green
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
            )
          ]),
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 50),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Align(
            alignment: Alignment.center,
            child: Draggable(
              data: item,
              feedback: item.toWidget(size: const Size.square(50)),
              child: item.toWidget(size: const Size.square(50)),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 50),
      ),
    );
  }
}
