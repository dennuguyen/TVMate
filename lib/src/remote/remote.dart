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
  late BonsoirBroadcast broadcast;

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
    broadcast = BonsoirBroadcast(service: widget.service);
  }

  @override
  void dispose() {
    broadcast.stop();
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
    await broadcast.ready;
  }

  void fire(String key) {
    print("Firing $key");
  }
}
