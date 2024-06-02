import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/device_list.dart';

class RemoteForm extends StatefulWidget {
  const RemoteForm({super.key});

  @override
  State<StatefulWidget> createState() => _RemoteForm();
}

class _RemoteForm extends State<RemoteForm> {
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
