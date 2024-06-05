import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';

class DeviceListService extends ChangeNotifier {
  DeviceListService._construct();

  static final DeviceListService _instance = DeviceListService._construct();

  factory DeviceListService() {
    return _instance;
  }

  BonsoirDiscovery discovery = BonsoirDiscovery(type: '_http._tcp');
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
    _devices.add(device);
    notifyListeners();
  }

  void _remove() {}

  Future<void> start() async {
    await discovery.ready;
    discovery.eventStream!.listen((e) {
      if (e.type == BonsoirDiscoveryEventType.discoveryServiceFound) {
        e.service!.resolve(discovery.serviceResolver);
        // TODO: opening modal while this is resolving crashes
      } else if (e.type == BonsoirDiscoveryEventType.discoveryServiceResolved) {
        _add(e.service!);
        print('Service resolved : ${e.service?.toJson()}');
      } else if (e.type == BonsoirDiscoveryEventType.discoveryServiceLost) {
        // TODO: remove service from list.
        // _remove();
        print('Service lost : ${e.service?.toJson()}');
      }
    });
    await discovery.start();
  }

  Future<void> stop() async {
    await discovery.stop();
    discovery = BonsoirDiscovery(type: '_http._tcp');
  }

  // Performs a clear and fetches device list again.
  Future<void> refresh() async {
    await stop();
    clear();
    await start();
  }
}
