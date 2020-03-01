import 'dart:convert';

import 'package:expenses_management_webapp/models/carro.dart';
import 'package:http/http.dart' as http;

class CarroRepository {
  
  final String endpoint = "https://carros-springboot.herokuapp.com/api/v1/carros";

  Future<List<Carro>> getCarros() async {
    List<Carro> carros;

    http.Client client = http.Client();

    http.Response response = await client.get(endpoint);

    //print(response.statusCode);
    //print(response.body);

    List items = json.decode(utf8.decode(response.bodyBytes));
    print(items);

    carros = items.map((e) => Carro.fromJson(e)).toList();
    print(carros);

    return carros;
  }

}