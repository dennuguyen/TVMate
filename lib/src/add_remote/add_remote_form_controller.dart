import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/device_list/device_list_controller.dart';
import 'package:tvmate/src/remote/remote.dart';
import 'package:tvmate/src/remote/remote_list_controller.dart';

class AddRemoteFormController extends ChangeNotifier {
  int selectedIndex = -1;
  final TextEditingController label = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController host = TextEditingController();
  late BonsoirService service = BonsoirService(name: "", type: "", port: 0);

  void selectDevice(BonsoirService service, int index) {
    selectedIndex = index;
    label.text = service.name;
    host.text = service.name;
    this.service = service;
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

    remotes.add(Remote(
      label: label.text,
      location: location.text,
      service: service,
    ));
  }

  // Clear form metadata.
  // Do not call refresh device list here.
  void clear() {
    selectedIndex = -1;
    label.clear();
    location.clear();
    service = BonsoirService(name: "", type: "", port: 0);
    notifyListeners();
  }
}
