import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/device_list/device.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';
import 'package:tvmate/src/remote/remote.dart';
import 'package:tvmate/src/remote/remote_list_model.dart';

class AddRemoteFormModel extends ChangeNotifier {
  int selectedIndex = -1;
  final TextEditingController label = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController ip = TextEditingController();
  final TextEditingController gateway = TextEditingController();
  final TextEditingController subnet = TextEditingController();
  final TextEditingController port = TextEditingController();

  void selectDevice(Device device, int index) {
    selectedIndex = index;
    label.text = device.mdnsInfo.getOnlyTheStartOfMdnsName();
    name.text = device.mdnsInfo.mdnsName;
    ip.text = device.activeHost.address;
    // port.text = device.mdnsInfo.mdnsPort;
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
      label: label.text,
      name: name.text,
      location: location.text,
      ip: ip.text,
      gateway: gateway.text,
      subnet: subnet.text,
      port: 1,
    ));
  }

  void clear() {
    selectedIndex = -1;
    label.clear();
    name.clear();
    location.clear();
    ip.clear();
    gateway.clear();
    subnet.clear();
    port.clear();
  }
}
