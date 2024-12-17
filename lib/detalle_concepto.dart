import 'package:flutter/material.dart';
import 'package:flutter_tutorial/inicio.dart';
import 'package:flutter_tutorial/modelo/conceptos_dart.dart';

class DetalleConcepto extends StatelessWidget{
  final ConceptoDart conceptoDart;
  const DetalleConcepto({super.key, required this.conceptoDart});
  @override
  Widget build (BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Inicio(id: 1,)),
          );
        },
        child: const Text('Inicio'),
      ),
      appBar: AppBar(
        title: const Text('Detalle conceptos Dart'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(conceptoDart.nombre),
              ),
              Text('Ejemplo: ${conceptoDart.nombre}.dart', style: const TextStyle(fontSize: 20),),
              Center(
                child: Container(
                  width: 380, height: 210,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    color: Colors.white54
                ),
                  child: Text(conceptoDart.codigoEjemplo, style: const TextStyle(fontFamily:'RobotoMono', fontSize: 20, color: Colors.blueGrey),),

                ),
              ),
              const Text('Salida en consola',style: TextStyle(fontSize: 20),),
              Container(
                width: 380, height: 200, padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                  color: Colors.black,
                ),
                child: Text('tom@pc:home\$dart ${conceptoDart.nombre}.dart\n ${conceptoDart.salidaEjemplo}\n tom@pc:home\$',style: const TextStyle(color: Colors.white, fontSize: 19),),
              ),
              Text('Descripción del concepto ${conceptoDart.nombre}', style: const TextStyle(fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
              Text(conceptoDart.descripcion, style: const TextStyle(fontSize: 18),)
            ],
          ),
        ),
      ),
    );
  }
}