import 'dart:async';
import 'package:flutter/material.dart';

import 'connectionStatusSingleton.dart';

class TestWidget extends StatefulWidget {
  @override
  TestWidgetState createState() => new TestWidgetState();
}

class TestWidgetState extends State<TestWidget> {
  StreamSubscription _connectionChangeStream;

  bool isOffline = false;

  @override
  initState() {
    super.initState();

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext ctxt) {
    return (isOffline)? new Text("Not connected") : new Text("Connected");
  }
}