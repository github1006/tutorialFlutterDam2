import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  const Boton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                print("Tomas Alvarez");
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  backgroundColor: Colors.amber),
              child: const Text("TOMAS BOTON")),
        ));
  }
}
