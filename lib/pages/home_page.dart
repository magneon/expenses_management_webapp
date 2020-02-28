import 'package:expenses_management_webapp/layout/debug_layout_size.dart';
import 'package:expenses_management_webapp/utils/font_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2
        ), 
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {

            double fontSize = FontUtil.fontSize(constraints.maxWidth * 0.05);

            return Card(
              elevation: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network("http://www.livroandroid.com.br/livro/carros/esportivos/Lamborghini_Aventador.png"),
                  Text("Lamborghini Aventador", style: TextStyle(fontSize: fontSize), overflow: TextOverflow.ellipsis)
                ],
              ),
            );
          },
        );
      },
      itemCount: 100),
    );
  }
}