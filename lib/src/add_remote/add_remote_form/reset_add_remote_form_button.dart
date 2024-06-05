import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form/add_remote_form_model.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';

class ResetAddRemoteFormButton extends StatefulWidget {
  const ResetAddRemoteFormButton({super.key});

  @override
  State<StatefulWidget> createState() => _ResetAddRemoteFormButton();
}

class _ResetAddRemoteFormButton extends State<ResetAddRemoteFormButton> {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<AddRemoteFormModel>(context);
    final devices = Provider.of<DeviceListModel>(context);
    return IconButton(
      onPressed: () {
        form.clear();
        devices.refetch();
      },
      icon: const Icon(Icons.refresh),
    );
  }
}
