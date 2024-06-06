import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form_service.dart';
import 'package:tvmate/src/device_list/device_list_service.dart';

class DeviceList extends StatefulWidget {
  const DeviceList({super.key});

  @override
  State<StatefulWidget> createState() => _DeviceList();
}

class _DeviceList extends State<DeviceList> {
  @override
  void initState() {
    super.initState();
    DeviceListService().start();
  }

  @override
  void dispose() {
    DeviceListService().clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devices = Provider.of<DeviceListService>(context);
    final form = Provider.of<AddRemoteFormService>(context);
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
