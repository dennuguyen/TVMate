import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_container.dart';
import 'package:tvmate/src/device_list/device_list_controller.dart';

class OpenAddRemoteModalButton extends StatelessWidget {
  const OpenAddRemoteModalButton({super.key});

  @override
  Widget build(BuildContext context) {
    final devices = Provider.of<DeviceListController>(context);
    devices.start();
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => const AddRemoteContainer(),
      ),
      child: const Text("Add remote"),
    );
  }
}
