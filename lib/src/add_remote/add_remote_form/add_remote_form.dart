import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form/add_remote_button.dart';
import 'package:tvmate/src/add_remote/add_remote_form/add_remote_form_model.dart';
import 'package:tvmate/src/add_remote/device_list/device_list.dart';

class AddRemoteForm extends StatefulWidget {
  const AddRemoteForm({super.key});

  @override
  State<StatefulWidget> createState() => _AddRemoteForm();
}

class _AddRemoteForm extends State<AddRemoteForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  // TODO: Clear the provider state when form is closed
  @override
  void deactivate() {
    // final form = Provider.of<AddRemoteFormModel>(context);
    // form.clear();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<AddRemoteFormModel>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Select a device to connect to"),
        const DeviceList(),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Give your remote a name",
          ),
          controller: form.label,
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Device name",
          ),
          controller: form.name,
          readOnly: true,
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "IP address",
          ),
          controller: form.ip,
          readOnly: true,
        ),
        const ButtonBar(children: [
          CloseButton(),
          AddRemoteButton(),
        ]),
      ],
    );
  }
}
