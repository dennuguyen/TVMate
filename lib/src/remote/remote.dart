import 'dart:io';

import 'package:flutter/material.dart';

class Remote extends StatefulWidget {
  final String label;
  final String name;
  final String location;
  final String ip;
  final String gateway;
  final String subnet;
  final int port;

  const Remote(
      {super.key,
      required this.ip,
      required this.label,
      required this.name,
      required this.location,
      required this.gateway,
      required this.subnet,
      required this.port});

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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.label),
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
        ),
      ),
    );
  }

  void fire(String key) {
    print("Firing $key");
  }
}