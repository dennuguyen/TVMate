import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_controller.dart';
import 'package:tvmate/src/remote/remote_icon.dart';

class RemoteHeader extends StatelessWidget {
  const RemoteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RemoteController>(context);
    return Row(
      children: [
        RemoteIcon(connected: controller.connected),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.label),
              Text("IP: ${controller.url}"),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: controller.retry,
        ),
      ],
    );
  }
}
