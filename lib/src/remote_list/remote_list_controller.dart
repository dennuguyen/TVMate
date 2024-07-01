import 'package:flutter/material.dart';
import 'package:tvmate/src/remote/remote.dart';

class RemoteListController extends ChangeNotifier {
  final List<Remote> _remotes = [];

  int get length => _remotes.length;
  Remote operator [](int i) => _remotes[i];
  void operator []=(int i, Remote remote) => _remotes[i] = remote;
  bool get isEmpty => _remotes.isEmpty;

  void add(Remote remote) {
    if (!_remotes.any((r) => r.service.name == remote.service.name)) {
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
