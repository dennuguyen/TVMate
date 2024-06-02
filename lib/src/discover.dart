import 'package:flutter/material.dart';
import 'package:network_tools/network_tools.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<StatefulWidget> createState() => _Discover();
}

class _DeviceInfo {
  final ActiveHost activeHost;
  final MdnsInfo mdnsInfo;

  _DeviceInfo(this.activeHost, this.mdnsInfo);
}

class _Discover extends State<Discover> {
  List<_DeviceInfo> devices = [];

  @override
  void initState() {
    super.initState();
    search();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: devices.map((device) {
      return ListTile(title: Text('''
        ${device.mdnsInfo.getOnlyTheStartOfMdnsName()}
        ${device.mdnsInfo.mdnsName}
        ${device.mdnsInfo.mdnsPort}
        ${device.mdnsInfo.mdnsServiceType}
        '''));
    }).toList());
  }

  Future<void> search() async {
    for (final ActiveHost activeHost
        in await MdnsScannerService.instance.searchMdnsDevices()) {
      final MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;
      setState(() {
        devices.add(_DeviceInfo(activeHost, mdnsInfo!));
      });
    }
  }
}
