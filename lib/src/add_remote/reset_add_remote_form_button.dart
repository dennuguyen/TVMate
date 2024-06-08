import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form_controller.dart';
import 'package:tvmate/src/device_list/device_list_controller.dart';

class ResetAddRemoteFormButton extends StatelessWidget {
  const ResetAddRemoteFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<AddRemoteFormController>(context);
    final devices = Provider.of<DeviceListController>(context);
    return IconButton(
      onPressed: () {
        form.clear();
        devices.refresh();
      },
      icon: const Icon(Icons.refresh),
    );
  }
}
