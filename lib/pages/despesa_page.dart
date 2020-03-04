import 'dart:developer';

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
            switch(snapshot.connectionState) {
              case ConnectionState.done:

                List<DataRow> rows = snapshot.data;

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
                    rows: rows
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

      Uri uri = Uri.https("gestao-financeira-changeit.herokuapp.com", "expense/period/3/2020");

      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {

        for (var item in json.decode(utf8.decode(response.bodyBytes))) {
          Expense expense = Expense(item);

          List<DataCell> cells = List();
          cells.add(_createDataCell(expense.getId.toString()));
          cells.add(_createDataCell(expense.getExpenseName));
          cells.add(_createDataCell(expense.getExpenseDescription));
          cells.add(_createDataCell(expense.getExpenseValue.toString()));
          cells.add(_createDataCell(expense.getExpenseType));
          cells.add(_createDataCell(expense.getExpenseDate));          

          DataRow dataRow = DataRow(cells: cells);

          rows.add(dataRow);
        }
      }
    } on Exception catch (e) {
      print(e);
    }

    print(rows);

    return rows;
  }

  _createDataCell(String content) {
    return DataCell(Text(content));
  }
}