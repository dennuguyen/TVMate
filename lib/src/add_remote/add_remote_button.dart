import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote.dart';
import 'package:tvmate/src/remote_list_model.dart';

class AddRemoteButton extends StatelessWidget {
  const AddRemoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteListModel>(builder:
        (BuildContext context, RemoteListModel remotes, Widget? child) {
      return TextButton(
          onPressed: () {
            remotes.add(const Remote(
              ip: '',
            ));
          },
          child: const Text("Add remote"));
    });
  }
}
