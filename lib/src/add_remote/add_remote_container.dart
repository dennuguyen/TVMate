import 'package:flutter/material.dart';
import 'package:tvmate/src/add_remote/add_remote_form.dart';

class AddRemoteContainer extends StatelessWidget {
  const AddRemoteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: const AddRemoteForm(),
    );
  }
}
