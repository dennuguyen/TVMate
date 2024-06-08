import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form_controller.dart';
import 'package:tvmate/src/device_list/device_list_controller.dart';

class DeviceList extends StatefulWidget {
  const DeviceList({super.key});

  @override
  State<StatefulWidget> createState() => _DeviceList();
}

class _DeviceList extends State<DeviceList> {
  @override
  void initState() {
    super.initState();
    DeviceListController().start();
  }

  @override
  void dispose() {
    DeviceListController().clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devices = Provider.of<DeviceListController>(context);
    final form = Provider.of<AddRemoteFormController>(context);
    return devices.isEmpty
        ? const CircularProgressIndicator()
        : Expanded(
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                return ListTile(
                  onTap: () => {form.selectDevice(device, index)},
                  selected: index == form.selectedIndex,
                  title: Text(device.name),
                );
              },
            ),
          );
  }
}
