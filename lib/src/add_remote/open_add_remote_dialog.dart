import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/add_remote_dialog.dart';

class OpenAddRemoteDialog extends StatelessWidget {
  const OpenAddRemoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => const AddRemoteDialog(),
      ),
      child: const Text("Add remote"),
    );
  }
}
