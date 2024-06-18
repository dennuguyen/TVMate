import 'dart:io';

import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';

class Remote extends StatefulWidget {
  final String label;
  final String location;
  final BonsoirService service;

  const Remote({
    super.key,
    required this.label,
    required this.location,
    required this.service,
  });

  @override
  State<StatefulWidget> createState() => _Remote();

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'location': location,
      'service': service.toJson(),
    };
  }
}

class _Remote extends State<Remote> {
  late final WebSocket websocket;

  Map<String, String> controlCodes = {
    "Power": "0000",
    "Vol +": "0001",
    "Vol -": "0010",
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
    start();
  }

  @override
  void dispose() {
    stop();
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
            Text("IP: ${widget.service.name}"),
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

  Future<void> start() async {
    // WebSocketException (WebSocketException: Unsupported URL scheme '')
    websocket = await WebSocket.connect(widget.service.name);
  }

  Future<void> stop() async {
    websocket.close();
  }

  void fire(String key) {
    websocket.add(controlCodes[key]);
  }
}
