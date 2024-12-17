import 'package:flutter/material.dart';

class Imagen extends StatelessWidget{
  const Imagen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Imagen'),),
        body:Row(
          children: [
            Expanded(child:
            Image.asset('assets/img/pupu1.jpg', width: 200,)
            )
          ],
        ),
    );
  }
}

