import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_list_controller.dart';

class RemoteList extends StatelessWidget {
  const RemoteList({super.key});

  @override
  Widget build(BuildContext context) {
    final remotes = Provider.of<RemoteListController>(context);
    return ListView.builder(
      itemCount: remotes.length,
      itemBuilder: (context, index) {
        final remote = remotes[index];
        return remote;
      },
    );
  }
}
