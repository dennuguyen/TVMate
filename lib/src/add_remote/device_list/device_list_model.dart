import 'dart:io';

import 'package:flutter/material.dart';
import 'package:network_tools/network_tools.dart';
import 'package:tvmate/src/add_remote/device_list/device.dart';

class DeviceListModel extends ChangeNotifier {
  DeviceListModel._construct();

  static final DeviceListModel _instance = DeviceListModel._construct();

  factory DeviceListModel() {
    return _instance;
  }

  final List<Device> _devices = [];

  int get length => _devices.length;
  Device operator [](int i) => _devices[i];
  void operator []=(int i, Device device) => _devices[i] = device;
  bool get isEmpty => _devices.isEmpty;

  // Clears the device list. It does not fetch again.
  // Important to never call notifyListeners() because cannot assume tree is unlocked.
  void clear() {
    _devices.clear();
  }

  // Performs a clear and fetches device list again.
  Future<void> refetch() async {
    clear();
    fetch();
  }

  void _add(Device device) {
    _devices.add(device);
    notifyListeners();
  }

  Future<void> fetch() async {
    try {
      for (final ActiveHost activeHost
          in await MdnsScannerService.instance.searchMdnsDevices()) {
        final MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;
        _add(Device(activeHost: activeHost, mdnsInfo: mdnsInfo!));
      }
    } catch (e) {
      throw SocketException(e.toString());
    }
  }
}
