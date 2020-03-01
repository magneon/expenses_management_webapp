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

    return Text("${app.pages.toString()}");
  }
}