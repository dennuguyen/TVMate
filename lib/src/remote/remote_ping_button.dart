import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_controller.dart';

class RemotePingButton extends StatelessWidget {
  const RemotePingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RemoteController>(context);
    return IconButton(
      icon: const Icon(Icons.network_ping),
      onPressed: () => controller.ping(),
    );
  }
}
