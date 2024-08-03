import 'package:flutter/material.dart';
import 'package:tvmate/src/remote/remote_controller.dart';
import 'package:tvmate/util/persistable.dart';

class RemoteListController extends ChangeNotifier with Persistable {
  final List<RemoteController> _remotes = [];

  int get length => _remotes.length;
  RemoteController operator [](int i) => _remotes[i];
  void operator []=(int i, RemoteController remote) => _remotes[i] = remote;
  bool get isEmpty => _remotes.isEmpty;

  // @override
  // Future<Object?> load(String key) {
  //   Object? remoteIds = await super.load('remotes');
  //   return super.load(key);
  // }

  // @override
  // Future<void> save(String key, Object object) {
  //   // TODO: implement save
  //   return super.save(key, object);
  // }

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
