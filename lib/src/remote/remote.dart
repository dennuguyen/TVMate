import 'dart:io';

import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';

// TODO: handle if disconnect and reconnect.
class Remote extends StatefulWidget {
  final String label;
  final String location;
  final ResolvedBonsoirService service;

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
  bool connected = false;

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
    try {
      String host = widget.service.host!;
      host = host.substring(0, host.length - 1);
      final port = widget.service.port;
      final url = 'ws://$host:$port';
      websocket = await WebSocket.connect(url);
      setState(() {
        connected = true;
      });
    } catch (e) {
      print('Websocket connection error: $e');
    }
  }

  Future<void> stop() async {
    if (connected) {
      websocket.close();
      setState(() {
        connected = false;
      });
    }
  }

  void fire(String key) {
    if (connected) {
      websocket.add(controlCodes[key]);
    }
  }
}
