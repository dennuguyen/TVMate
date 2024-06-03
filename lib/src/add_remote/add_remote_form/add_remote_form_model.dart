import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';
import 'package:tvmate/src/remote/remote.dart';
import 'package:tvmate/src/remote/remote_list_model.dart';

class AddRemoteFormModel extends ChangeNotifier {
  int selectedIndex = 0;
  late String name;

  void selectIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void submit(BuildContext context) {
    final remotes = Provider.of<RemoteListModel>(context, listen: false);
    final devices = Provider.of<DeviceListModel>(context, listen: false);

    if (devices.isEmpty) {
      return;
    }

    final device = devices[selectedIndex];
    // device.mdnsInfo.mdnsName;
    // device.mdnsInfo.mdnsPort;

    remotes.add(Remote(
      ip: device.activeHost.address,
    ));
  }
}
