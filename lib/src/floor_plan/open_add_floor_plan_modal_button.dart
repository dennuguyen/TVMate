import 'package:flutter/material.dart';
import 'package:tvmate/src/floor_plan/floor_plan.dart';

class OpenAddFloorPlanModalButton extends StatelessWidget {
  const OpenAddFloorPlanModalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => const Dialog(
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.white70,
          child: FloorPlan(),
        ),
      ),
      child: const Text("Add floor plan"),
    );
  }
}
