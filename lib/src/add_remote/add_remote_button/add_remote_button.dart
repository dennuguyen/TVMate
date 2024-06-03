import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/add_remote_button/add_remote_button_controller.dart';

class AddRemoteButton extends StatelessWidget {
  const AddRemoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => AddRemoteButtonController.onSubmit(context),
      child: const Text("Add remote"),
    );
  }
}
