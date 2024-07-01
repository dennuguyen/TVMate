import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_controller.dart';

class RemoteResetButton extends StatelessWidget {
  const RemoteResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RemoteController>(context);
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: controller.retry,
    );
  }
}
