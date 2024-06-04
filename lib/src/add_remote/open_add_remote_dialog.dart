import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/add_remote_container.dart';

class OpenAddRemoteDialog extends StatelessWidget {
  const OpenAddRemoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: delay when opening dialog after several opens
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => const AddRemoteContainer(),
      ),
      child: const Text("Add remote"),
    );
  }
}
