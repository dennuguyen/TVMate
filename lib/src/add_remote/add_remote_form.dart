import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_button.dart';
import 'package:tvmate/src/add_remote/add_remote_form_service.dart';
import 'package:tvmate/src/add_remote/reset_add_remote_form_button.dart';
import 'package:tvmate/src/device_list/device_list.dart';
import 'package:tvmate/src/device_list/device_list_service.dart';

class AddRemoteForm extends StatefulWidget {
  const AddRemoteForm({super.key});

  @override
  State<StatefulWidget> createState() => _AddRemoteForm();
}

class _AddRemoteForm extends State<AddRemoteForm> {
  // final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<AddRemoteFormService>(context);
    final devices = Provider.of<DeviceListService>(context);
    return Scaffold(
      body: PopScope(
        onPopInvoked: (didPop) {
          form.clear();
          devices.stop();
        },
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
                      labelText: "Host name",
                    ),
                    controller: form.host,
                    enabled: false,
                  ),
                  Text(form.service.name),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const ButtonBar(children: [
        ResetAddRemoteFormButton(),
        AddRemoteButton(),
      ]),
    );
  }
}
