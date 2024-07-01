import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_button_set.dart';
import 'package:tvmate/src/remote/remote_controller.dart';
import 'package:tvmate/src/remote/remote_header.dart';

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
}

class _Remote extends State<Remote> {
  late RemoteController controller;

  @override
  void initState() {
    super.initState();
    controller = RemoteController(
      label: widget.label,
      location: widget.location,
      service: widget.service,
    );
    controller.start();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.start();
    return ChangeNotifierProvider<RemoteController>.value(
      value: controller,
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(4.0),
                child: RemoteHeader(),
              ),
              RemoteButtonSet(),
            ],
          ),
        ),
      ),
    );
  }
}
