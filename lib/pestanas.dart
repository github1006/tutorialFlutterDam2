
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/lista_dart.dart';
import 'package:flutter_tutorial/intro.dart';

// por el momento ya no se usa esta clase se usa la pestana2 en vez.
class Pestanas extends StatelessWidget {
final int pestanaInicial;
const Pestanas({super.key, this.pestanaInicial=0});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
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
            BottomNavigationBarItem(icon: Icon(Icons.flight_takeoff), label: 'Buscar'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Liborito'),
            BottomNavigationBarItem(icon: Icon(Icons.book),label: 'Perderse')
          ],
        ),
        body: const TabBarView(
          children:[
            Intro(), // Pasar queEsFlutter a Intro2
            ListaDart(),
          ],
        ),
      ),
    );
  }
}
