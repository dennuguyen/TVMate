import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/device_list/device.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';
import 'package:tvmate/src/remote/remote.dart';
import 'package:tvmate/src/remote/remote_list_model.dart';

class AddRemoteFormModel extends ChangeNotifier {
  int selectedIndex = 0;
  late String label;
  late String name;
  late String location;
  late String ip;
  late String gateway;
  late String subnet;
  late int port;

  void selectDevice(Device device, int index) {
    selectedIndex = index;
    label = device.mdnsInfo.mdnsName;
    name = device.mdnsInfo.mdnsName;
    ip = device.activeHost.address;
    port = device.mdnsInfo.mdnsPort;
    notifyListeners();
  }

  void setLocation(String location) {
    location = location;
    notifyListeners();
  }

  void submit(BuildContext context) {
    final remotes = Provider.of<RemoteListModel>(context, listen: false);
    final devices = Provider.of<DeviceListModel>(context, listen: false);

    if (devices.isEmpty) {
      return;
    }

    remotes.add(Remote(
      label: label,
      name: name,
      location: location,
      ip: ip,
      gateway: gateway,
      subnet: subnet,
      port: port,
    ));
  }
}
