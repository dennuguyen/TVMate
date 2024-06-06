import 'package:flutter/material.dart';
import 'package:tvmate/src/remote/remote.dart';

class RemoteListService extends ChangeNotifier {
  final List<Remote> _remotes = [];

  int get length => _remotes.length;
  Remote operator [](int i) => _remotes[i];
  void operator []=(int i, Remote remote) => _remotes[i] = remote;
  bool get isEmpty => _remotes.isEmpty;

  // TODO: prevent duplicates.
  void add(Remote remote) {
    _remotes.add(remote);
    notifyListeners();
  }
}