import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/open_add_remote_dialog.dart';
import 'package:tvmate/src/remote/remote_list_model.dart';

class RemoteList extends StatelessWidget {
  const RemoteList({super.key});

  @override
  Widget build(BuildContext context) {
    final remotes = Provider.of<RemoteListModel>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: remotes.length,
        itemBuilder: (context, index) {
          final remote = remotes[index];
          return remote;
        },
      ),
      floatingActionButton: const OpenAddRemoteDialog(),
    );
  }
}
