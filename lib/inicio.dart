import 'package:flutter/material.dart';
import 'package:flutter_tutorial/bloques_pantall.dart';
import 'package:flutter_tutorial/historia/pdfFlutter.dart';
import 'package:flutter_tutorial/lista_dart.dart';
import 'package:flutter_tutorial/pestanas2.dart';
import 'package:url_launcher/url_launcher.dart';

class Inicio extends StatefulWidget {
  final int id; // Agregar un id que recibirás en el constructor.
  const Inicio({super.key, required this.id}); // Sin Key // Asegúrate de pasar el id al constructor
  @override
  State<Inicio> createState() => _InicioState();
}


class _InicioState extends State<Inicio> {
  @override
  Widget build (BuildContext contex){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tutorial Flutter Sof2295',style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Text('Menú'),
            ),
            ListTile(
              title: const Text('Ir a inicio'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Inicio(id: 1,)),
                );
              },
            ),
            ListTile(
              title: const Text('Ir a Dart'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListaDart()),
                );
              },
            ),

            ListTile(
              title: const Text('Cerrar Drawer'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Ir a inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Dart'),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: 'Flutter')
        ],
        onTap: (int index){
          switch (index){
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Inicio(id: index,)));
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ListaDart()));
          }
        },
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/img/logo.png',width: 200,),
          ),
          const SizedBox(height:100),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Bienvenido al tutorial de Flutter y Dart, disfruta tu aprendizage',style: TextStyle(fontSize: 18, color: Colors.black),),
          ),
          Center(
            child: InkWell(
              onTap: () async {
                final url = Uri.parse('https://flutter.dev');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const Text(
                'Ir a Flutter Dev',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 26,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(height:100),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Pestanas2(pestanaInicial2: 2)),
                            );
                          },
                          child: Image.asset('assets/img/dart.png', width: 100), // Tu imagen
                        ),
                        ElevatedButton(
                          onPressed:(){Navigator.push(contex, MaterialPageRoute(builder: (context)=>const Pestanas2(pestanaInicial2: 2,)),
                          );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor:Colors.amber,
                            backgroundColor:Colors.blueGrey,

                          ),
                          child: const Text('Dart',style: TextStyle(fontSize:28),),
                        ),
                        ElevatedButton(
                          onPressed:(){Navigator.push(contex, MaterialPageRoute(builder: (context)=>const BloquePantalla(id: 1,)),
                          );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor:Colors.amber,
                            backgroundColor:Colors.blueGrey,

                          ),
                          child: const Text('BD',style: TextStyle(fontSize:28),),
                        ),
                      ],
                    ),

                    const SizedBox(width: 80,),

                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (contex)=>const Pestanas2(pestanaInicial2: 1,)));
                          },
                          child: Image.asset('assets/img/flutter.jpeg',width: 100,),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (contex)=>const Pestanas2(pestanaInicial2: 1,))
                            );
                          },
                          child: const Text('Flutter',style: TextStyle(fontSize: 28),),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (contex)=> BloquePantalla(id: 1))
                            );
                          },
                          child: const Text('Mas',style: TextStyle(fontSize: 28),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )

        ],
      ),

    );
  }
}