import 'dart:io';

import 'package:flutter/material.dart';
import 'package:network_tools/network_tools.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/device.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';

class DeviceListController {
  static Future<void> fetch(BuildContext context) async {
    final devices = Provider.of<DeviceListModel>(context, listen: false);
    try {
      for (final ActiveHost activeHost
          in await MdnsScannerService.instance.searchMdnsDevices()) {
        final MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;
        devices.add(Device(activeHost: activeHost, mdnsInfo: mdnsInfo!));
      }
    } catch (e) {
      throw SocketException(e.toString());
    }
  }

  static void clear() {
    DeviceListModel().clear();
  }
}
