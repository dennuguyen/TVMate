import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_controller.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';

class DeviceList extends StatefulWidget {
  const DeviceList({super.key});

  @override
  State<StatefulWidget> createState() => _DeviceList();
}

class _DeviceList extends State<DeviceList> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    DeviceListController.fetch(context);
  }

  @override
  void dispose() {
    DeviceListController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceListModel>(builder:
        (BuildContext context, DeviceListModel devices, Widget? child) {
      return devices.isEmpty
          ? const CircularProgressIndicator()
          : SizedBox(
              height: 300.0,
              width: 300.0,
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final device = devices[index];
                  return ListTile(
                    onTap: () => _onItemTap(index),
                    selected: index == _selectedIndex,
                    title: Text(device.mdnsInfo.getOnlyTheStartOfMdnsName()),
                  );
                },
              ),
            );
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
