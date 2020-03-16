import 'package:flutter/material.dart';

class SnackBars extends StatefulWidget {
  SnackBars(this.name);
  String name;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SnackBars(name);
  }
}

class _SnackBars extends State {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _SnackBars(this.name);
  String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: showSnackBar(_scaffoldKey, name),
      ),
    );
  }

  showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, name) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(name),
    ));
  }
}
