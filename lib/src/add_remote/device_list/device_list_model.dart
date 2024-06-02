import 'package:flutter/material.dart';
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

  void clear() {
    _devices.clear();
  }

  void add(Device device) {
    _devices.add(device);
    notifyListeners();
  }
}
