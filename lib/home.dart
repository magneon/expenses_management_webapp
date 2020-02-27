import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Size get size => MediaQuery.of(context).size;

  bool get showDrawer => size.width <= 760;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Web = ${size.width} / ${size.height}"),
        automaticallyImplyLeading: showDrawer,
      ),
      body: _body(),
      drawer: Drawer(
        child: _menu(),
      ),
    );
  }
      
  _body() {
    return showDrawer ? _right() : Row(
      children: <Widget>[
        _menu(),
        _right()
      ],
    );
  }

  _right() {
    return Container(
      width: showDrawer ? size.width : size.width - 230,
      color: Colors.grey,
    );
  }

  _menu() {
    return Container(
      width: 230,
      color: Colors.blue[100],
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.accessible_forward),
            title: Text("Item 1"),
          ),
          ListTile(
            leading: Icon(Icons.accessible_forward),
            title: Text("Item 2"),
          ),
          ListTile(
            leading: Icon(Icons.accessible_forward),
            title: Text("Item 3"),
          )
        ],
      ),
    );
  }
}