import 'package:flutter/material.dart';
import 'package:network_tools/network_tools.dart';

class Device extends StatelessWidget {
  final ActiveHost activeHost;
  final MdnsInfo mdnsInfo;

  const Device({super.key, required this.activeHost, required this.mdnsInfo});

  String get name => mdnsInfo.getOnlyTheStartOfMdnsName();
  String get ip => activeHost.address;
  int get port => mdnsInfo.mdnsPort;
  String get serviceType => mdnsInfo.mdnsServiceType;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text('''
        $name
        $ip
        $port
        '''),
    );
  }
}
