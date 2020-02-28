import 'package:flutter/material.dart';

import 'package:expenses_management_webapp/layout/north.dart';
import 'package:expenses_management_webapp/layout/left.dart';
import 'package:expenses_management_webapp/layout/right.dart';
import 'package:expenses_management_webapp/layout/south.dart';

import 'package:expenses_management_webapp/constants.dart';
import 'package:expenses_management_webapp/utils/color_util.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Size get size => MediaQuery.of(context).size;

  bool get showMenuCollapsed => size.width < 760;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Left(),
      ),
      body: _body(),
    );
  }
      
  _body() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _north(),
        _center(),
        _south()
      ],
    );
  }  

  _north() {
    return Container(
      padding: EdgeInsets.all(16),
      width: size.width,
      height: headerHeight,
      color: ColorUtil.getHeaderColor(),
      child: North(title: "Home"),
    );
  }

  _center() {
    return Container(
      width: size.width,
      height: size.height - headerHeight - footerHeight,
      child: !showMenuCollapsed ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _left(),
          _right()
        ],
      ) : _right()
    );
  }

  _left() {
    return Container(
      width: menuWidth,
      color: Colors.blue[100],
      child: Left()
    );
  }

  _right() {
    return Container(
      width: !showMenuCollapsed ? size.width - menuWidth : size.width,
      padding: EdgeInsets.all(20),
      //color: Colors.red,
      child: Right(),
    );
  }

  _south() {
    return Container(
      height: footerHeight,
      color: Colors.black,
      child: South(),
    );
  }
}