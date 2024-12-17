import 'package:flutter/material.dart';

class Escafold extends StatelessWidget{
  const Escafold({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold')
        ),
      bottomNavigationBar:BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.landslide_sharp),label: 'Laptop'),
          BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: 'Carro'),
          BottomNavigationBarItem(icon: Icon(Icons.keyboard), label: 'Teclado')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          print('Tomas Alvarez');
        }
      ),
      backgroundColor: Colors.limeAccent,
      body: const Column(
        children: [
          Text('''
          El Scaffold es un widget fundamental en Flutter que proporciona una estructura de diseño coherente y fácil de usar para las aplicaciones. Facilita la implementación de una interfaz de usuario consistente siguiendo las directrices de Material Design, permitiendo a los desarrolladores centrarse en la funcionalidad y el contenido de la aplicación.
          ''', style: TextStyle(fontSize: 28),)
        ],
      ),
    );
    
  }
}