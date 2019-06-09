import 'package:flutter/material.dart';
import 'package:pr_spook/model/Server.dart';

class ServersListWidget extends StatelessWidget {
  final List<Server> servers;
  ServersListWidget(this.servers);

  Widget _buildServerItem(BuildContext context, int index) {
    Server server = servers[index];

    return Container(
        width: double.infinity,
        child: ListTile(
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTap(index),
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              child: CircleAvatar(),
            ),
          ),
          title: Text(server.serverName),
          subtitle: Text(
              server.mapName +
                  " - "
                  + server.numPlayers.toString()
                  + "/"
                  + server.maxPlayers.toString()),
          dense: false,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: _buildServerItem, itemCount: servers.length);
  }

  //Item selected
  onTap(int index) {

  }
}
