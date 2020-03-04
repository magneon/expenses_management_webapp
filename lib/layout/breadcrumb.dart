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

    List<Widget> breadcrumbItems = List();
    breadcrumbItems.add(Icon(Icons.home, color: Colors.white));

    for (var page in app.pages) {
      if (!page.title.contains("Home")) {
        breadcrumbItems.add(Icon(Icons.arrow_right, color: Colors.white));
        breadcrumbItems.add(Text("${page.title}", style: TextStyle(color: Colors.white)));
      }
    }

    return Row(children: breadcrumbItems);
  }
}