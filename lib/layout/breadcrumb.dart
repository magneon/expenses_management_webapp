import 'package:expenses_management_webapp/models/page_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app.dart';

class Breadcrumb extends StatefulWidget {
  @override
  _BreadcrumbState createState() => _BreadcrumbState();
}

class _BreadcrumbState extends State<Breadcrumb> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: app.pages.length,
      itemBuilder: (context, index) {
        PageInfo pageInfo = app.pages[index];

        bool isHomePage = index == 0;

        return InkWell(
          onTap: () => _onClickBreadCrumb(index),
          child: Row(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.expand(width: isHomePage ? 32 : 24),
                child: Icon(isHomePage ? Icons.home : Icons.arrow_right, color: Colors.white)
              ),
              Text(pageInfo.title, style: TextStyle(color: Colors.white))
            ],
          ),
        );
      }
    );
  }

  _onClickBreadCrumb(int index) {

    App app = Provider.of<App>(context, listen: false);

    if (index == 0) {
      app.popAll();
    } else {
      app.popTo(index);
    }
  }
}