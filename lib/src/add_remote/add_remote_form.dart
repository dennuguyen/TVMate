import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/add_remote_button/add_remote_button.dart';
import 'package:tvmate/src/add_remote/device_list/device_list.dart';

class AddRemoteForm extends StatefulWidget {
  const AddRemoteForm({super.key});

  @override
  State<StatefulWidget> createState() => _AddRemoteForm();
}

class _AddRemoteForm extends State<AddRemoteForm> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Select a device to connect to"),
        DeviceList(),
        ButtonBar(children: [
          CloseButton(),
          AddRemoteButton(),
        ]),
      ],
    );
  }
}
