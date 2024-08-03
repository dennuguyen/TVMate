import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote.dart';
import 'package:tvmate/src/remote_list/remote_list_controller.dart';

class RemoteList extends StatefulWidget {
  const RemoteList({super.key});

  @override
  State<RemoteList> createState() => _RemoteListState();
}

class _RemoteListState extends State<RemoteList> {
  @override
  Widget build(BuildContext context) {
    final remotes = Provider.of<RemoteListController>(context);
    return ListView.builder(
      itemCount: remotes.length,
      itemBuilder: (context, index) {
        final remote = remotes[index];
        return Remote(controller: remote);
      },
    );
  }
}
