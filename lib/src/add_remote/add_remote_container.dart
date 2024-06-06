import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/add_remote_form.dart';

class AddRemoteContainer extends StatelessWidget {
  const AddRemoteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: UI bug where backgrounds are slightly diff colour due to padding.
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const AddRemoteForm(),
    );
  }
}
