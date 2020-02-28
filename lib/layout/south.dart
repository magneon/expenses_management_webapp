import 'package:flutter/material.dart';

class South extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text("Pet Emergency", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
        ),
        Expanded(
          flex: 1,
          child: Text("© All Rights Reserved", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
        )
      ],
    );
  }
}