import 'package:flutter/material.dart';

class RemoteIcon extends StatelessWidget {
  final bool connected;

  const RemoteIcon({super.key, required this.connected});

  @override
  Widget build(BuildContext context) {
    return Icon(connected
        ? Icons.desktop_windows_outlined
        : Icons.desktop_access_disabled);
  }
}
