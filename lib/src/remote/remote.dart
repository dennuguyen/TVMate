import 'dart:io';

import 'package:flutter/material.dart';

class Remote extends StatefulWidget {
  final String ip;

  const Remote({super.key, required this.ip});

  @override
  State<StatefulWidget> createState() => _Remote();
}

class _Remote extends State<Remote> {
  static int remoteCount = 0;

  late int id;
  late WebSocket ws;

  Map<String, String> controlCodes = {
    "Power": "",
    "Vol +": "",
    "Vol -": "",
    "Mute": "",
    "Ch +": "",
    "Ch -": "",
    "1": "",
    "2": "",
    "3": "",
    "4": "",
    "5": "",
    "6": "",
    "7": "",
    "8": "",
    "9": "",
    "0": "",
  };

  @override
  void initState() {
    super.initState();
    id = remoteCount++;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Remote $id"),
        Text("IP: ${widget.ip}"),
        Wrap(
          children: controlCodes.keys.map((key) {
            return ElevatedButton(
              onPressed: () => fire(key),
              child: Text(key),
            );
          }).toList(),
        )
      ],
    );
  }

  void fire(String key) {
    print("Firing $key");
  }
}
