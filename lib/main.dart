import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:expenses_management_webapp/models/app.dart';
import 'package:expenses_management_webapp/layout/home.dart';
import 'package:expenses_management_webapp/utils/color_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => App())
      ],
      child: MaterialApp(
        title: 'Expenses Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          hoverColor: ColorUtil.getHoverColor()
        ),
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
