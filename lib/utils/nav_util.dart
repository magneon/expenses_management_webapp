import 'package:flutter/material.dart';

push(BuildContext context, Widget page, {bool replacement = false}) {
  if (replacement) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => page,
    ));
  } else {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}