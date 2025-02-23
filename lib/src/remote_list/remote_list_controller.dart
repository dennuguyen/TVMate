import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tvmate/src/remote/remote_controller.dart';
import 'package:tvmate/src/remote/remote_model.dart';

class RemoteListController extends ChangeNotifier {
  final List<RemoteController> _remotes = [];

  int get length => _remotes.length;
  RemoteController operator [](int i) => _remotes[i];
  void operator []=(int i, RemoteController remote) => _remotes[i] = remote;
  bool get isEmpty => _remotes.isEmpty;

  Future<void> save() async {
    var modelJsons = _remotes.map((r) => {r.label: r.model.toJson()});
    print(json.encode(modelJsons));
    // print(json.encode());
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString(
    //     'remotes', json.encode(_remotes.map((r) => r.toString())));
  }

  // Future<RemoteModel?> load() async {}

  void add(RemoteController remote) async {
    if (!_remotes.any((r) => r.url == remote.url)) {
      _remotes.add(remote);
      notifyListeners();

      // Save data.
      // save('remotes', remoteIds!);
    }
  }

  bool remove(RemoteController remote) {
    final success = _remotes.remove(remote);
    notifyListeners();
    return success;
  }
}
