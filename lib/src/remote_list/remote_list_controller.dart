import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tvmate/src/remote/remote.dart';

class RemoteListController extends ChangeNotifier {
  final List<Remote> _remotes = [];

  int get length => _remotes.length;
  Remote operator [](int i) => _remotes[i];
  void operator []=(int i, Remote remote) => _remotes[i] = remote;
  bool get isEmpty => _remotes.isEmpty;

  void load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? strs = prefs.getStringList('remotes');
    for (var str in strs!) {
      var remote = json.decode(str);
      _remotes.add(Remote(
        label: remote['label'],
        url: '',
        location: '',
      ));
    }
  }

  void save() async {}

  void add(Remote remote) {
    if (!_remotes.any((r) => r.url == remote.url)) {
      _remotes.add(remote);
      notifyListeners();
    }
  }

  bool remove(Remote remote) {
    final success = _remotes.remove(remote);
    notifyListeners();
    return success;
  }
}
