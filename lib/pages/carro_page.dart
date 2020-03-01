import 'package:expenses_management_webapp/models/page_info.dart';
import 'package:flutter/material.dart';

import 'package:expenses_management_webapp/models/app.dart';
import 'package:expenses_management_webapp/models/carro.dart';
import 'package:expenses_management_webapp/pages/carro_detail_page.dart';
import 'package:expenses_management_webapp/repositories/carro_repository.dart';
import 'package:expenses_management_webapp/utils/font_util.dart';

import 'package:provider/provider.dart';

class CarroPage extends StatefulWidget {
  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CarroRepository().getCarros(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Carro> carros = snapshot.data;

          return _listView(carros);
        },
      ),
    );
  }

  _listView(List<Carro> carros) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2
        ), 
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {

            Carro carro = carros[index];

            double fontSize = FontUtil.fontSize(constraints.maxWidth * 0.05);

            return InkWell(
              onTap: (){
                _onClickCarro(context, carro);
              },
              child: Card(
                elevation: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(carro.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/esportivos/Lamborghini_Aventador.png"),
                    Text(carro.nome ?? "", style: TextStyle(fontSize: fontSize), overflow: TextOverflow.ellipsis)
                  ],
                ),
              ),
            );
          },
        );
      },
      itemCount: carros.length
    );
  }

  void _onClickCarro(BuildContext context, Carro carro) {
    App app = Provider.of<App>(context, listen: false);

    app.changePage(PageInfo(carro.nome, CarroDetailPage(carro)));
  }
}