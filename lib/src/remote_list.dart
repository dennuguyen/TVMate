import 'package:flutter/material.dart';
import 'package:tvmate/src/remote.dart';
import 'package:multicast_dns/multicast_dns.dart';

class RemoteList extends StatefulWidget {
  const RemoteList({super.key});

  @override
  State<StatefulWidget> createState() => _RemoteList();
}

class _RemoteList extends State<RemoteList> {
  List<Widget> remotes = [];
  final MDnsClient client = MDnsClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: remotes.length,
        itemBuilder: (context, index) {
          final remote = remotes[index];
          return remote;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("Add remote"),
        onPressed: () {
          addRemote(Remote(key: UniqueKey(), ip: ""));
        },
      ),
    );
  }

  void addRemote(Remote remote) {
    setState(() {
      remotes.add(remote);
    });
  }
}
