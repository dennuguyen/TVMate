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

  // TODO: Prevent submit when there's no device selected.
  void submit(BuildContext context) {
    final remotes = Provider.of<RemoteListModel>(context, listen: false);
    final form = Provider.of<AddRemoteFormModel>(context, listen: false);
    final devices = Provider.of<DeviceListModel>(context, listen: false);

    final device = devices[form.selectedIndex];
    // device.mdnsInfo.mdnsName;
    // device.mdnsInfo.mdnsPort;

    remotes.add(Remote(
      ip: device.activeHost.address,
    ));
  }
}
