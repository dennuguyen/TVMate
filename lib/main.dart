import 'package:flutter/material.dart';
import 'package:network_tools/network_tools.dart';
import 'package:path_provider/path_provider.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDirectory = await getApplicationDocumentsDirectory();
  await configureNetworkTools(appDocDirectory.path, enableDebugging: true);

  runApp(const App());
}
