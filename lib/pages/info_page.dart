import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: _createItems(context),
    );
  }

  _createItems(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text("Default Font Family: ${Theme.of(context).textTheme.bodyText1.fontFamily}"),
        ],
      ),
    );
  }
}