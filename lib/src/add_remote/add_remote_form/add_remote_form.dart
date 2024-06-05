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
  // final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<AddRemoteFormModel>(context);
    return Scaffold(
      body: PopScope(
        onPopInvoked: (didPop) => form.clear(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              child: Column(
                children: [
                  Text("Select a device to connect to"),
                  DeviceList(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Give your remote a name",
                    ),
                    controller: form.label,
                    enabled: form.selectedIndex == -1 ? false : true,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Device name",
                    ),
                    controller: form.name,
                    enabled: false,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "IP address",
                    ),
                    controller: form.ip,
                    enabled: false,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const ButtonBar(children: [
        // CloseButton(),
        AddRemoteButton(),
      ]),
    );
  }
}
