import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote.dart';
import 'package:tvmate/src/remote/remote_list_controller.dart';

class RemoteDeleteButton extends StatelessWidget {
  const RemoteDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RemoteListController>(context);
    return IconButton(
      icon: const Icon(Icons.delete_outline),
      onPressed: () =>
          controller.remove(context.findAncestorWidgetOfExactType<Remote>()!),
    );
  }
}
