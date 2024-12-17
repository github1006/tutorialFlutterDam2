import 'package:flutter/material.dart';

class Texto extends StatelessWidget{
  const Texto({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Hola soy un texto')),
        ],
      )
    );
  }
}