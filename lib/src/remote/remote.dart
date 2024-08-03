import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/remote/remote_button_set.dart';
import 'package:tvmate/src/remote/remote_controller.dart';
import 'package:tvmate/src/remote/remote_header.dart';

class Remote extends StatefulWidget {
  final RemoteController controller;

  const Remote({
    super.key,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => _Remote();
}

class _Remote extends State<Remote> {
  @override
  void initState() {
    super.initState();
    widget.controller.start();
  }

  @override
  void dispose() {
    widget.controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.start();
    return ChangeNotifierProvider<RemoteController>.value(
      value: widget.controller,
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
