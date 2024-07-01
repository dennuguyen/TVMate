import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_controller.dart';
import 'package:tvmate/src/remote/remote_delete_button.dart';
import 'package:tvmate/src/remote/remote_icon.dart';
import 'package:tvmate/src/remote/remote_reset_button.dart';

class RemoteHeader extends StatelessWidget {
  const RemoteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RemoteController>(context);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: RemoteIcon(connected: controller.connected),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.label),
                Text(controller.url),
              ],
            ),
          ),
        ),
        const ButtonBar(
          children: [
            RemoteDeleteButton(),
            RemoteResetButton(),
          ],
        ),
      ],
    );
  }
}
