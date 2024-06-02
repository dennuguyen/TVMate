import 'dart:io';

import 'package:flutter/material.dart';
import 'package:network_tools/network_tools.dart';
import 'package:tvmate/src/add_remote/device.dart';

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

  void clearAll() {
    _devices.clear();
  }

  Future<void> fetch() async {
    await _fetchDevicesOnLocalNetwork();
    notifyListeners();
  }

  void _add(Device device) {
    _devices.add(device);
    notifyListeners();
  }

  Future<void> _fetchDevicesOnLocalNetwork() async {
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
