import 'package:flutter/material.dart';
import 'package:tvmate/src/remote.dart';

class AddRemote extends StatelessWidget {
  const AddRemote({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: Remote(
        ip: '192.1.1.8',
      ),
    );
  }

  // @override
  // _AddRemote createState() =>
}
