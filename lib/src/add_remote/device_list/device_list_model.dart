import 'dart:io';

import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/device_list/device.dart';

class DeviceListModel extends ChangeNotifier {
  DeviceListModel._construct();

  static final DeviceListModel _instance = DeviceListModel._construct();

  factory DeviceListModel() {
    return _instance;
  }

  final List<Device> _devices = [];
  static const String type = '_http._tcp';
  BonsoirDiscovery discovery = BonsoirDiscovery(type: type);

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

  Future<void> start() async {
    await discovery.ready;
    discovery.eventStream!.listen((event) {
      // `eventStream` is not null as the discovery instance is "ready" !
      if (event.type == BonsoirDiscoveryEventType.discoveryServiceFound) {
        print('Service found : ${event.service?.toJson()}');
        // Should be called when the user wants to connect to this service.
        event.service!.resolve(discovery.serviceResolver);
      } else if (event.type ==
          BonsoirDiscoveryEventType.discoveryServiceResolved) {
        print('Service resolved : ${event.service?.toJson()}');
      } else if (event.type == BonsoirDiscoveryEventType.discoveryServiceLost) {
        print('Service lost : ${event.service?.toJson()}');
      }
    });
    await discovery.start();
  }

  Future<void> fetch() async {
    try {
      // for (final ActiveHost activeHost
      //     in await MdnsScannerService.instance.searchMdnsDevices()) {
      //   final MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;
      //   _add(Device(activeHost: activeHost, mdnsInfo: mdnsInfo!));
      // }
    } catch (e) {
      discovery.stop();
      throw SocketException(e.toString());
    }
  }
}
