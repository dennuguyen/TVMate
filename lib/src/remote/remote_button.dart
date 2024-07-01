import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_controller.dart';

class RemoteButton extends StatelessWidget {
  final String command;

  const RemoteButton({super.key, required this.command});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RemoteController>(context);
    return ElevatedButton(
      onPressed: controller.connected ? () => controller.fire(command) : null,
      child: Text(command),
    );
  }
}
