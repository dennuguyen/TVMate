import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_service.dart';
import 'package:tvmate/src/remote/remote.dart';
import 'package:tvmate/src/remote/remote_list_service.dart';

class AddRemoteFormService extends ChangeNotifier {
  int selectedIndex = -1;
  final TextEditingController label = TextEditingController();
  final TextEditingController location = TextEditingController();
  late BonsoirService service = BonsoirService(name: "", type: "", port: 0);

  void selectDevice(BonsoirService service, int index) {
    selectedIndex = index;
    this.service = service;
    notifyListeners();
  }

  void setLocation(String location) {
    location = location;
    notifyListeners();
  }

  void submit(BuildContext context) {
    final remotes = Provider.of<RemoteListService>(context, listen: false);
    final devices = Provider.of<DeviceListService>(context, listen: false);

    if (devices.isEmpty) {
      return;
    }

    remotes.add(Remote(
      label: label.text,
      location: location.text,
      service: service,
    ));
  }

  void clear() {
    selectedIndex = -1;
    label.clear();
    location.clear();
    service = BonsoirService(name: "", type: "", port: 0);
    notifyListeners();
  }
}
