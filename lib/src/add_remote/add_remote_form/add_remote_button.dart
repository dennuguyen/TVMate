import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form/add_remote_form_model.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';

class AddRemoteButton extends StatelessWidget {
  const AddRemoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<AddRemoteFormModel>(context);
    final devices = Provider.of<DeviceListModel>(context);
    return TextButton(
      onPressed: devices.isEmpty ? null : () => form.submit(context),
      child: const Text("Add remote"),
    );
  }
}
