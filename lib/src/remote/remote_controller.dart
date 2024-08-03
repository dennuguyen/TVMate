import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class RemoteController extends ChangeNotifier {
  final String label;
  final String url;
  final String location;
  WebSocket? websocket;
  bool get connected => websocket != null;
  Timer? _pingTimer;
  Timer? _pongTimer;

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
    required this.url,
    required this.location,
  });

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  // TODO: auto-connect websocket if remote is in remote list
  Future<void> start() async {
    if (connected) {
      return;
    }

    try {
      websocket = await WebSocket.connect(url);
      websocket!.listen((event) {
        if (event == "pong") {
          _pongTimer?.cancel();
        }
      });
      _pinging();
      notifyListeners();
    } catch (e) {
      stop();
    }
  }

  Future<void> stop() async {
    await websocket?.close();
    websocket = null;
    _pingTimer?.cancel();
    _pongTimer?.cancel();
    notifyListeners();
  }

  Future<void> retry() async {
    await stop();
    await start();
  }

  void fire(String key) {
    websocket?.add(commands[key]);
  }

  void ping() {
    websocket?.add('ping');
  }

  // TODO: after auto-connecting, device will act disconnected
  void _pinging() {
    _pingTimer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        ping();
        _ponging();
      },
    );
  }

  void _ponging() {
    _pongTimer?.cancel();
    _pongTimer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) => stop(),
    );
  }
}
