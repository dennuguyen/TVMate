import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';
import 'package:tvmate/src/add_remote/device_list/selectable_index_model.dart';

class DeviceList extends StatefulWidget {
  const DeviceList({super.key});

  @override
  State<StatefulWidget> createState() => _DeviceList();
}

class _DeviceList extends State<DeviceList> {
  @override
  void initState() {
    super.initState();
    DeviceListModel().fetch();
  }

  @override
  void dispose() {
    DeviceListModel().clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devices = Provider.of<DeviceListModel>(context);
    final selected = Provider.of<SelectableIndexModel>(context);
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
                  onTap: () => {selected.set(index)},
                  selected: index == selected.index,
                  title: Text(device.mdnsInfo.getOnlyTheStartOfMdnsName()),
                );
              },
            ),
          );
  }
}
