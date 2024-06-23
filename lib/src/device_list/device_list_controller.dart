import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';

class DeviceListController extends ChangeNotifier {
  static const String _serviceType = '_esp8266._tcp';
  BonsoirDiscovery discovery = BonsoirDiscovery(type: _serviceType);
  final List<BonsoirService> _devices = [];

  int get length => _devices.length;
  BonsoirService operator [](int i) => _devices[i];
  void operator []=(int i, BonsoirService device) => _devices[i] = device;
  bool get isEmpty => _devices.isEmpty;

  // Clears the device list. It does not fetch again.
  // Important to never call notifyListeners() because cannot assume tree is unlocked.
  void clear() {
    _devices.clear();
  }

  void _add(BonsoirService device) {
    if (!_devices.any((d) => d.name == device.name)) {
      _devices.add(device);
      notifyListeners();
    }
  }

  void _remove(BonsoirService device) {
    _devices.removeWhere((d) => d.name == device.name);
    notifyListeners();
  }

  Future<void> start() async {
    await discovery.ready;
    discovery.eventStream!.listen((e) {
      switch (e.type) {
        case BonsoirDiscoveryEventType.discoveryServiceFound:
          e.service!.resolve(discovery.serviceResolver);
        case BonsoirDiscoveryEventType.discoveryServiceResolved:
          _add(e.service!);
        case BonsoirDiscoveryEventType.discoveryServiceLost:
          _remove(e.service!);
        default:
      }
    });
    await discovery.start();
  }

  Future<void> stop() async {
    await discovery.stop();
    discovery = BonsoirDiscovery(type: _serviceType);
  }

  // Performs a clear and fetches device list again.
  Future<void> refresh() async {
    await stop();
    clear();
    await start();
  }
}
