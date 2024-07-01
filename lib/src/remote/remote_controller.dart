import 'dart:io';

import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';

class RemoteController extends ChangeNotifier {
  late final String label;
  late final String location;
  late final ResolvedBonsoirService service;
  late String url;
  WebSocket? websocket;
  bool get connected => websocket != null;

  Map<String, String> commands = {
    "Power": "20DF10EF",
    "Vol +": "20DF40BF",
    "Vol -": "20DFC03F",
    "Mute": "20DF906F",
    "Ch +": "20DF00FF",
    "Ch -": "20DF807F",
    "1": "20DF8877",
    "2": "20DF48B7",
    "3": "20DFC837",
    "4": "20DF28D7",
    "5": "20DFA857",
    "6": "20DF6897",
    "7": "20DFE817",
    "8": "20DF18E7",
    "9": "20DF9867",
    "0": "20DF08F7",
  };

  RemoteController({
    required this.label,
    required this.location,
    required this.service,
  }) {
    String host = service.host!;
    host = host.substring(0, host.length - 1);
    url = 'ws://$host:${service.port}';
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  Future<void> start() async {
    if (connected) {
      return;
    }

    try {
      websocket = await WebSocket.connect(url);
      // Pings the device. Will auto-disconnect if no pong.
      // websocket.pingInterval = const Duration(seconds: 5);
      notifyListeners();
    } catch (e) {
      stop();
      print(e);
    }
  }

  Future<void> stop() async {
    await websocket?.close();
    websocket = null;
    notifyListeners();
  }

  Future<void> retry() async {
    await stop();
    await start();
  }

  void fire(String key) {
    websocket?.add(commands[key]);
  }
}
