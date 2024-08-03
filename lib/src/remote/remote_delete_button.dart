import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_controller.dart';
import 'package:tvmate/src/remote_list/remote_list_controller.dart';

class RemoteDeleteButton extends StatelessWidget {
  const RemoteDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteList = Provider.of<RemoteListController>(context);
    final remote = Provider.of<RemoteController>(context);
    return IconButton(
      icon: const Icon(Icons.delete_outline),
      onPressed: () => remoteList.remove(remote),
    );
  }
}
