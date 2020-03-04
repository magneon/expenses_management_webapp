import 'package:expenses_management_webapp/layout/breadcrumb.dart';
import 'package:expenses_management_webapp/layout/debug_layout_size.dart';
import 'package:flutter/material.dart';

import 'package:expenses_management_webapp/layout/user_content.dart';

class North extends StatefulWidget {

  final String title;

  North({this.title});

  @override
  _NorthState createState() => _NorthState();
}

class _NorthState extends State<North> {
  Size get size => MediaQuery.of(context).size;
  
  bool get showMenuCollapsed => size.width < 760;
  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _menuIcon(),
            Expanded(
              child: Text("Expenses Management", style: TextStyle(color: Colors.white),)
            ),
            _userData()
          ],
        ),
        Divider(
          color: Colors.white,
          height: 20,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Breadcrumb(),
          ),
        )
        /*
        Expanded(
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Icon(Icons.home, color: Colors.white),
                onTap: () {
                  print("Voltando pra Home");
                },
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.arrow_right, color: Colors.white),
                  Text(widget.title, style: TextStyle(color: Colors.white))
                ],
              )
            ],
          ),
        )
        */
      ],
    );
  }

  _menuIcon() {
    return showMenuCollapsed ? GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Icon(Icons.menu, color: Colors.white, size: 30)
      ),
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
    ) : Container();
  }

  _userData() {
    return showMenuCollapsed ? Container() : UserContent();
  }
}