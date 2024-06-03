import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form/add_remote_form_model.dart';

class AddRemoteButton extends StatelessWidget {
  const AddRemoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<AddRemoteFormModel>(context);
    return TextButton(
      onPressed: () => form.submit(context),
      child: const Text("Add remote"),
    );
  }
}
