import 'package:flutter/material.dart';

class UsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text("Usuários"),
    );
  }
}