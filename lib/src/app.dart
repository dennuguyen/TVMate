import 'package:flutter/material.dart';
import 'package:tvmate/src/remote.dart';

class App extends StatelessWidget {
  List<Widget> remotes = [];

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: remotes),
        floatingActionButton: FloatingActionButton(
          child: const Text("Add remote"),
          onPressed: () {
            remotes.add(const Remote(ip: ""));
          },
        ),
      ),
    );
  }
}
