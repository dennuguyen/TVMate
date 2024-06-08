import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_button.dart';
import 'package:tvmate/src/add_remote/add_remote_form_controller.dart';
import 'package:tvmate/src/add_remote/reset_add_remote_form_button.dart';
import 'package:tvmate/src/device_list/device_list.dart';
import 'package:tvmate/src/device_list/device_list_controller.dart';

class AddRemoteForm extends StatelessWidget {
  const AddRemoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<AddRemoteFormController>(context);
    final devices = Provider.of<DeviceListController>(context);
    devices.start();
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
