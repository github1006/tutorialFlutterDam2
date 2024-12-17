import 'package:flutter/material.dart';

class Tarjeta2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarjeta Sencilla"),
      ),
      body: Center(
        child: Card(
          elevation: 5,  // Sombra de la tarjeta
          shape: RoundedRectangleBorder(  // Bordes redondeados
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),  // Espaciado dentro de la tarjeta
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Título de la Tarjeta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Este es un ejemplo de una tarjeta sencilla en Flutter.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}