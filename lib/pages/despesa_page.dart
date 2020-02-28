import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:expenses_management_webapp/models/expense.dart';


class DespesaPage extends StatefulWidget {
  @override
  _DespesaPageState createState() => _DespesaPageState();
}

class _DespesaPageState extends State<DespesaPage> {
  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: _getDataRows(),
          builder: (context, snapshot) {
            print(snapshot.data);

            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Card(
                  elevation: 1,
                  child: DataTable(
                    horizontalMargin: 20,
                    columns: [
                      DataColumn(
                        label: Text("ID"),
                      ),
                      DataColumn(
                        label: Text("Expense Name"),
                      ),
                      DataColumn(
                        label: Text("Expense Description"),
                      ),
                      DataColumn(
                        label: Text("Expense Value"),
                      ),
                      DataColumn(
                        label: Text("Expense Type"),
                      ),
                      DataColumn(
                        label: Text("Expense Date"),
                      )
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                        ]
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                        ]
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                        ]
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                        ]
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                        ]
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                          DataCell(Text("Nome da Despesa")),
                        ]
                      )
                    ],
                  )
                );
                break;

              default:
                return Center(
                  child: Text("Sem conteúdo"),
                );
                break;
            }
          },
        )
      )
    );
  }  

  _getDataRows() async {
    List<DataRow> rows = List();

    try {
      http.Client client = http.Client();
      print(client);

      http.Response response = await client.get("http://192.168.122.1:8080/expense/period/janeiro-2020");
      if (response.statusCode == 200) {
        for (var item in json.decode(utf8.decode(response.bodyBytes))) {
          Expense expense = Expense(item);

          DataRow dataRow = DataRow(
            cells: [
              DataCell(Text(expense.getId.toString())),
              DataCell(Text(expense.getExpenseName)),
              DataCell(Text(expense.getExpenseDescription)),
              DataCell(Text(expense.getExpenseValue.toString())),
              DataCell(Text(expense.getExpenseType)),
              DataCell(Text(expense.getExpenseDate)),
            ]
          );

          rows.add(dataRow);
        }
      }
    } on Exception catch (e) {
      print(e);
    }
    

    return rows;
  }
}