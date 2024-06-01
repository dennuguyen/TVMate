import 'package:flutter/material.dart';
import 'package:tvmate/src/remote_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: RemoteList(),
      ),
    );
  }
}
