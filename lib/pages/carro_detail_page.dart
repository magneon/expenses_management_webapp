import 'package:expenses_management_webapp/models/carro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app.dart';

class CarroDetailPage extends StatefulWidget {

  final Carro carro;

  CarroDetailPage(this.carro);

  @override
  _CarroDetailPageState createState() => _CarroDetailPageState();
}

class _CarroDetailPageState extends State<CarroDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(widget.carro.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/esportivos/Lamborghini_Aventador.png"),
          Text(widget.carro.nome ?? ""),
          RaisedButton(
            child: Text("Voltar"),
            onPressed: _onClickVoltar,
          )
        ],
      ),
    );
  }

  _onClickVoltar() {
    App app = Provider.of<App>(context, listen: false);
    app.pop();
  }
}