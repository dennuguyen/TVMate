import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form_service.dart';
import 'package:tvmate/src/device_list/device_list_service.dart';

class ResetAddRemoteFormButton extends StatefulWidget {
  const ResetAddRemoteFormButton({super.key});

  @override
  State<StatefulWidget> createState() => _ResetAddRemoteFormButton();
}

class _ResetAddRemoteFormButton extends State<ResetAddRemoteFormButton> {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<AddRemoteFormService>(context);
    final devices = Provider.of<DeviceListService>(context);
    return IconButton(
      onPressed: () {
        form.clear();
        devices.refresh();
      },
      icon: const Icon(Icons.refresh),
    );
  }
}
