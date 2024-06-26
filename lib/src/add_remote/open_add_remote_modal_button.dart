import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/add_remote_container.dart';

class OpenAddRemoteModalButton extends StatelessWidget {
  const OpenAddRemoteModalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => const AddRemoteContainer(),
      ),
      child: const Text("Add remote"),
    );
  }
}
