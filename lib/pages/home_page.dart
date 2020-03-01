import 'package:flutter/material.dart';

import 'package:expenses_management_webapp/utils/font_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text("Home"),
    );
  }
}