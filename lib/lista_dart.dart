import 'package:flutter/material.dart';
import 'package:flutter_tutorial/detalle_concepto.dart';
import 'package:flutter_tutorial/modelo/conceptos_dart.dart';

class ListaDart extends StatefulWidget{
  const ListaDart({super.key});

  @override
  State<ListaDart> createState() => _ListaDartState();
}

class _ListaDartState extends State<ListaDart> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:dataDart.length,
      itemBuilder: (context, index){
        return Material(
          child: ListTile(
            title: Text(dataDart[index].nombre),
            leading: Image.asset('assets/img/dart.png',width:60),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetalleConcepto(conceptoDart: dataDart[index]))
              );
            } ,
          ),
        );
      },
    );
  }
}