import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/device_list/device_list_model.dart';
import 'package:tvmate/src/remote_list.dart';
import 'package:tvmate/src/remote_list_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider must be placed at root because of Navigator.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RemoteListModel()),
        ChangeNotifierProvider(create: (context) => DeviceListModel())
      ],
      child: const MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: RemoteList(),
        ),
      ),
    );
  }
}
