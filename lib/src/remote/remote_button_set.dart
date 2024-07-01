import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_button.dart';
import 'package:tvmate/src/remote/remote_controller.dart';

class RemoteButtonSet extends StatelessWidget {
  const RemoteButtonSet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RemoteController>(context);
    // TODO: make look nicer
    return Wrap(
      children: controller.commands.keys.map((c) {
        return RemoteButton(command: c);
      }).toList(),
    );
  }
}
