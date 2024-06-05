import 'package:flutter/material.dart';
import 'package:tvmate/src/remote/remote.dart';

class RemoteListModel extends ChangeNotifier {
  final List<Remote> _remotes = [];

  int get length => _remotes.length;
  Remote operator [](int i) => _remotes[i];
  void operator []=(int i, Remote remote) => _remotes[i] = remote;

  void add(Remote remote) {
    _remotes.add(remote);
    notifyListeners();
  }
}