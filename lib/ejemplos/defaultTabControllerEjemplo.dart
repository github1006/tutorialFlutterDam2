
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/intro.dart';
import 'package:flutter_tutorial/lista_widget.dart';
import 'package:flutter_tutorial/ejemplos/navegacion.dart';

class ControladorPestanasDefecto extends StatelessWidget {
  const ControladorPestanasDefecto({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Tutorial de Flutter')),
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Pestaña 1'),),
              Tab(child: Text('Pestaña 2')),
              Tab(child: Text('Pestaña 3')),
            ],
          ),
        ),
        body: const TabBarView(
          children:[
            Intro(), // Pasar queEsFlutter a Intro2
            ListaWidget(id: 1,),
            DeNavegacion()
          ],
        ),
      ),
    );
  }
}
