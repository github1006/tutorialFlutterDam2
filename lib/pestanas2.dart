
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/lista_dart.dart';
import 'package:flutter_tutorial/intro.dart';
import 'package:flutter_tutorial/lista_widget.dart';

import 'inicio.dart';

class Pestanas2 extends StatefulWidget {
final int pestanaInicial2;
const Pestanas2({super.key, this.pestanaInicial2=0});

  @override
  State<Pestanas2> createState() => _Pestanas2State();
}

class _Pestanas2State extends State<Pestanas2> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: widget.pestanaInicial2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Tutorial de Flutter')),
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Intro'),),
              Tab(child: Text('Widget Flutter')),
              Tab(child: Text('Dart')),
            ],
          ),
        ),
        bottomNavigationBar:BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Ir a inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Libro'),
            BottomNavigationBarItem(icon: Icon(Icons.book),label: 'Nada')
          ],
          onTap: (int index){
            switch (index){
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Inicio(id: index,)));
            }
          },
        ),
        body: const TabBarView(
          children:[
            Intro(), // Pasar queEsFlutter a Intro2
            ListaWidget(id: 1),
            ListaDart(),
          ],
        ),
      ),
      //initialIndex: 1,
    );
  }
}
