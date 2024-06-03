import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';
import 'package:tvmate/src/add_remote/device_list/selectable_index_model.dart';
import 'package:tvmate/src/remote/remote.dart';
import 'package:tvmate/src/remote/remote_list_model.dart';

class AddRemoteButtonController {
  static void onSubmit(BuildContext context) {
    final remotes = Provider.of<RemoteListModel>(context, listen: false);
    final selected = Provider.of<SelectableIndexModel>(context, listen: false);
    final devices = Provider.of<DeviceListModel>(context, listen: false);

    final device = devices[selected.index];
    // device.mdnsInfo.mdnsName;
    // device.mdnsInfo.mdnsPort;

    remotes.add(Remote(
      ip: device.activeHost.address,
    ));
  }
}
