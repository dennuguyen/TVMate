import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form.dart';

class AddRemoteDialog extends StatelessWidget {
  const AddRemoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, remotes, Widget? child) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: AddRemoteForm(),
          ),
        );
      },
    );
  }
}
