import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/device_list/device_list.dart';

class AddRemoteForm extends StatefulWidget {
  const AddRemoteForm({super.key});

  @override
  State<StatefulWidget> createState() => _AddRemoteForm();
}

class _AddRemoteForm extends State<AddRemoteForm> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Select a device to connect to"),
          const DeviceList(),
          ButtonBar(children: [
            const CloseButton(),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  print("form submitted");
                }
              },
              child: const Text("select"),
            ),
          ]),
        ],
      ),
    );
  }
}
