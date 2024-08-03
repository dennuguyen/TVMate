import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/device_list/device_list_controller.dart';
import 'package:tvmate/src/remote/remote_controller.dart';
import 'package:tvmate/src/remote_list/remote_list_controller.dart';

class AddRemoteFormController extends ChangeNotifier {
  int selectedIndex = -1;
  final TextEditingController label = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController host = TextEditingController();
  final TextEditingController url = TextEditingController();
  late ResolvedBonsoirService service =
      ResolvedBonsoirService(host: '', name: '', type: '', port: 0);

  void selectDevice(ResolvedBonsoirService service, int index) {
    this.service = service;
    selectedIndex = index;
    label.text = service.name;
    host.text = service.name;

    // Get URL.
    String temp = service.host!;
    temp = temp.substring(0, temp.length - 1);
    url.text = 'ws://$temp:${service.port}';

    notifyListeners();
  }

  void setLocation(String location) {
    location = location;
    notifyListeners();
  }

  void submit(BuildContext context) {
    final remotes = Provider.of<RemoteListController>(context, listen: false);
    final devices = Provider.of<DeviceListController>(context, listen: false);

    if (devices.isEmpty) {
      return;
    }

    remotes.add(RemoteController(
      label: label.text,
      url: url.text,
      location: location.text,
    ));
  }

  // Clear form metadata.
  // Do not call refresh device list here.
  void clear() {
    selectedIndex = -1;
    label.clear();
    location.clear();
    service = ResolvedBonsoirService(host: '', name: '', type: '', port: 0);
    notifyListeners();
  }
}
