import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/device_list/device_list_service.dart';
import 'package:tvmate/src/remote/remote_list_service.dart';

class RemoteList extends StatelessWidget {
  const RemoteList({super.key});

  @override
  Widget build(BuildContext context) {
    final remotes = Provider.of<RemoteListService>(context);
    final devices = Provider.of<DeviceListService>(context);
    devices.start();
    return ListView.builder(
      itemCount: remotes.length,
      itemBuilder: (context, index) {
        final remote = remotes[index];
        return remote;
      },
    );
  }
}
