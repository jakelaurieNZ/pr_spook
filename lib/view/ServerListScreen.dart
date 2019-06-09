import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

import 'package:pr_spook/model/Server.dart';
import 'package:pr_spook/view/widget/ServersListWidget.dart';

class ServerListScreen extends StatefulWidget {
  ServerListScreen({Key key}) : super(key: key);

  @override
  _ServerListScreenState createState() => _ServerListScreenState();
}

class _ServerListScreenState extends State<ServerListScreen> {
  Future<List<Server>> serversFuture;

  @override
  void initState() {
    super.initState();
    serversFuture = fetchServerInformation();
  }

  //Fetch all server information as a future
  Future<List<Server>> fetchServerInformation() async {
    final response =
    await get('https://www.realitymod.com/prspy/json/serverdata.json');

    if(response.statusCode == 200) {
      //Server returns bad json data
      //We need to remove the first leading characters before we hit a
      //JSON object

      final String cleanResponse =
      response.body.substring(response.body.indexOf("{"), response.body.length);

      Map serverJson = jsonDecode(cleanResponse);
      Iterable serverIterable = serverJson['Data'];
      List<Server> servers = serverIterable.map((model) =>
          Server.fromJson(model)).toList();

      //Parse complete
      return servers;

    } else {
      //Don't actually handle errors like this
      //Investigate and surface appropriate message to user
      throw Exception('Failed to load server data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRSpook'),
      ),
      body: Center(
        child: FutureBuilder<List<Server>>(
          future: serversFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  //Build the serversListWidget
  Widget buildList(List<Server> servers) {
    return Container(
      child: ServersListWidget(servers),
    );
  }
}
