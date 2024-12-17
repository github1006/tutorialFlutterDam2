import 'package:flutter/material.dart';

class VistaDesplazableConUnSoloHijo extends StatelessWidget{
  const VistaDesplazableConUnSoloHijo({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Descripción de SingleChildScrollView'),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'SingleChildScrollView',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'SingleChildScrollView es un widget que permite desplazar un único hijo cuando su contenido es más grande que el área visible.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Propiedades Principales:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '- scrollDirection (Axis): Dirección del desplazamiento. Valores: Axis.vertical (predeterminado) o Axis.horizontal.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- controller (ScrollController?): Controlador opcional para controlar el desplazamiento.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- primary (bool): Si es true, este es el ScrollView primario en la jerarquía de widgets. Valor predeterminado: true.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- physics (ScrollPhysics?): Define la física del desplazamiento, como la velocidad y la fricción.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- padding (EdgeInsetsGeometry?): Espaciado alrededor del contenido dentro del ScrollView.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- reverse (bool): Si es true, el contenido se desplaza en orden inverso. Valor predeterminado: false.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- child (Widget?): El único hijo que se desplazará dentro del ScrollView.',
                style: TextStyle(fontSize: 16),
              ),
              Text("""
              La historia de SingleChildScrollView está intrínsecamente relacionada con el desarrollo y la evolución de Flutter, el framework de interfaz de usuario creado por Google. Aquí te presento un resumen de su evolución:

Orígenes y Desarrollo de Flutter
Inicio del Proyecto Flutter: Flutter fue inicialmente desarrollado por Google como una herramienta para crear interfaces de usuario nativas de alto rendimiento para móviles. La primera versión de Flutter fue lanzada en mayo de 2017 durante la conferencia Google I/O.

Necesidad de Desplazamiento en Flutter: Desde sus primeras versiones, Flutter tenía como objetivo proporcionar widgets poderosos y flexibles para construir interfaces de usuario. La capacidad de manejar contenido desplazable era una necesidad fundamental, especialmente para aplicaciones móviles donde la pantalla es limitada y a menudo se necesita desplazarse para ver todo el contenido.

Introducción de SingleChildScrollView
Concepto de Scroll en Flutter: Para abordar la necesidad de desplazamiento, Flutter introdujo varios widgets relacionados con el scroll. Uno de los más básicos y esenciales fue SingleChildScrollView, diseñado para envolver un único widget hijo y permitir que su contenido se desplace si es más grande que el área visible.

Desarrollo y Lanzamiento: SingleChildScrollView fue incluido en las primeras versiones públicas de Flutter, proporcionando a los desarrolladores una herramienta sencilla pero efectiva para manejar contenido desplazable vertical y horizontalmente.

Evolución y Mejoras
Optimización y Rendimiento: A medida que Flutter evolucionaba, Google realizó varias optimizaciones en el framework para mejorar el rendimiento y la eficiencia de widgets como SingleChildScrollView. Esto incluía mejoras en la gestión de memoria, la velocidad de renderizado y la respuesta al desplazamiento.

Funciones Adicionales: Con el tiempo, se añadieron propiedades y características adicionales a SingleChildScrollView, como physics para personalizar el comportamiento de desplazamiento, controller para un control más preciso del scroll, y padding para agregar espacio alrededor del contenido.

Importancia en el Ecosistema Flutter
Uso Común: SingleChildScrollView se ha convertido en uno de los widgets más utilizados en Flutter debido a su simplicidad y utilidad. Es común verlo en aplicaciones que necesitan manejar formularios largos, listas de contenido o cualquier disposición que exceda el tamaño de la pantalla.

Compatibilidad y Extensibilidad: Gracias a su diseño sencillo, SingleChildScrollView es compatible con una amplia variedad de widgets hijos, lo que permite a los desarrolladores crear interfaces de usuario complejas y desplazables con facilidad.
              """)
            ],
          ),
        ),
      ),
    );
  }
}