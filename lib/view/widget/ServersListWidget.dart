import 'package:flutter/material.dart';
import 'package:pr_spook/model/Server.dart';

class ServersListWidget extends StatelessWidget {
  final List<Server> servers;
  ServersListWidget(this.servers);

  Widget _buildServerItem(BuildContext context, int index) {
    Server server = servers[index];

    return Container(
        width: double.infinity,
        child: InkWell(onTap: () {
          onTap(index);
        },
            child: ListTile(
              leading: Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                child: CircleAvatar(backgroundImage: getImageForCountry(server.country)),
              ),
              title: Text(getTitleForServer(server)),
              subtitle: Text(getSubtitleForServer(server)),
              dense: false,
            )
        )
    );
  }

  //Return image from assets based on 'Country' flag
  //eg. 'US'
  //Flag assets are /assets/flags/XX.png
  AssetImage getImageForCountry(String country) {
    return AssetImage("assets/flags/" + country + ".png");
  }

  //Return title for server widget
  String getTitleForServer(Server server) {
    return server.serverName;
  }

  //Return constructed subtitle for server widget
  String getSubtitleForServer(Server server) {
    return server.mapName +
        " - "
        + server.numPlayers.toString()
        + "/"
        + server.maxPlayers.toString();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: _buildServerItem, itemCount: servers.length);
  }

  //Item selected
  onTap(int index) {
    print('onTap' + index.toString());
  }
}
