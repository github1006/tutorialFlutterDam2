import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  // final QueEsFlutter queEsFlutter;
  // Intro(this.queEsFlutter);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Text('Flutter', style: TextStyle(color: Colors.lightBlue, fontSize: 20, fontWeight: FontWeight.bold),),
          Text('''
  Es un SDK móvil, hace posible "El escribe una vez y desplegalo donde sea" fue influenciado por ReactJS. 
  
  Flutter tiene muchas librerías. Todo es Widget y los widget son clases Dart.
  
  ''', style: TextStyle(color: Colors.brown, fontSize: 16),),
          Text('Dart', style:TextStyle(color: Colors.lightBlue,fontSize:20,fontWeight:FontWeight.bold)),
          Text('''
  Se eligio este lenguaje para Flutter porque soporta Just in Time (JIT) compilación y Compilacion Anticipada (AOT=Ahead of Time).
 
 
  ''', style:TextStyle(fontSize: 16, color: Colors.brown)),
        ],
      ),
    );
  }
}
