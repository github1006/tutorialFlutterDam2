import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Centro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo de Center")),
      body: MiCentro(),
    );
  }
}

class MiCentro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Este texto está centrado.",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}