import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

import 'package:pr_spook/model/Server.dart';
import 'package:pr_spook/view/widget/ServersListWidget.dart';

class ServerInfoScreen extends StatefulWidget {
  final Server server;

  ServerInfoScreen({Key key, this.server}) : super(key: key)


}
