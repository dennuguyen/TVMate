import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmate/src/add_remote/add_remote_form_controller.dart';
import 'package:tvmate/src/add_remote/open_add_remote_modal_button.dart';
import 'package:tvmate/src/device_list/device_list_controller.dart';
import 'package:tvmate/src/floor_plan/open_add_floor_plan_modal_button.dart';
import 'package:tvmate/src/remote/remote_list.dart';
import 'package:tvmate/src/remote/remote_list_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider must be placed at root because of Navigator.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RemoteListController()),
        ChangeNotifierProvider(create: (context) => DeviceListController()),
        ChangeNotifierProvider(create: (context) => AddRemoteFormController()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: const Scaffold(
          backgroundColor: Colors.white,
          body: RemoteList(),
          floatingActionButton: ButtonBar(children: [
            OpenAddFloorPlanModalButton(),
            OpenAddRemoteModalButton(),
          ]),
        ),
      ),
    );
  }
}
