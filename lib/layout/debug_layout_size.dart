import 'package:flutter/material.dart';

class DebugLayoutSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        return Center(
          child: Container(
            child: Text(">> ${contraints.maxWidth} / ${contraints.maxHeight} <<"),
          ),
        );
      },
    );
  }
}