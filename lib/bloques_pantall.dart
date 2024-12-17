import 'package:flutter/material.dart';
import 'package:flutter_tutorial/editarBloques.dart';
import 'package:flutter_tutorial/inicio.dart';
import 'package:flutter_tutorial/bloques_logica.dart';
import 'package:flutter_tutorial/modelo/base_datos_ayuda.dart';


class BloquePantalla extends StatefulWidget {
  final int id; // ID del bloque
  const BloquePantalla({super.key, required this.id}); // Constructor
  @override
  _BloquePantallaState createState() => _BloquePantallaState();
}

class _BloquePantallaState extends State<BloquePantalla> {
  final BloquesLogica bloquesLogica = BloquesLogica();
  final BaseDatosAyuda baseDatosAyuda=BaseDatosAyuda();

  // Controladores para los campos del formulario
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController propiedadesController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController codigoEjemploController = TextEditingController();
  final TextEditingController videoUrlController = TextEditingController();

  // Variable para almacenar la información ingresada
  String bloqueInfo = '';

  @override
  void initState() {
    super.initState();
    bloquesLogica.iniciaBd().then((_) {
      setState(() {}); // Actualiza la interfaz una vez cargada la base de datos
    });
    print("Base de datos inicializada");
  }

  @override
  void dispose() {
    // Libera los controladores cuando el widget se elimina
    nombreController.dispose();
    tipoController.dispose();
    propiedadesController.dispose();
    descripcionController.dispose();
    codigoEjemploController.dispose();
    videoUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloques'),
      ),
      body: Column(
        children: [
          // Formulario para ingresar datos del bloque
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: "Nombre del Widget"),
                ),
                TextField(
                  controller: tipoController,
                  decoration: const InputDecoration(labelText: "Tipo del Widget"),
                ),
                TextField(
                  controller: propiedadesController,
                  decoration: const InputDecoration(labelText: "Propiedades"),
                ),
                TextField(
                  controller: descripcionController,
                  decoration: const InputDecoration(labelText: "Descripción"),
                ),
                TextField(
                  controller: codigoEjemploController,
                  decoration: const InputDecoration(labelText: "Código de Ejemplo"),
                ),
                TextField(
                  controller: videoUrlController,
                  decoration: const InputDecoration(labelText: "Video url"),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      child: const Text("Agregar Bloque"),
                      onPressed: () {
                        if (nombreController.text.isNotEmpty &&
                            tipoController.text.isNotEmpty &&
                            propiedadesController.text.isNotEmpty &&
                            descripcionController.text.isNotEmpty &&
                            codigoEjemploController.text.isNotEmpty) {
                          // Agregar el bloque a la base de datos
                          bloquesLogica.anadirBloque(
                            nombreController.text,
                            tipoController.text,
                            propiedadesController.text,
                            descripcionController.text,
                            codigoEjemploController.text,
                            videoUrlController.text
                          ).then((_) {
                            setState(() {
                              // Actualiza la interfaz y muestra la información ingresada
                              bloqueInfo = '''
                          Nombre: ${nombreController.text}
                          Tipo: ${tipoController.text}
                          Propiedades: ${propiedadesController.text}
                          Descripción: ${descripcionController.text}
                          Código de Ejemplo: ${codigoEjemploController.text}
                          ''';
                              // Limpia los campos de texto
                              nombreController.clear();
                              tipoController.clear();
                              propiedadesController.clear();
                              descripcionController.clear();
                              codigoEjemploController.clear();
                              videoUrlController.clear();
                            });
                          });
                        }
                      },
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Inicio(id: 1,)));
                      },
                      child: const Text("Inicio"),
                    )
                  ],
                ),

                const SizedBox(height: 10),
                // Contenedor que muestra la información del bloque
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(bloqueInfo),
                ),
              ],
            ),
          ),
          // Lista de bloques existentes
          Expanded(
            child: ListView.builder(
              itemCount: bloquesLogica.bloquesFlutter.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bloquesLogica.bloquesFlutter[index]['nombreWidget']),
                  leading: const Icon(Icons.widgets),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      bloquesLogica.borrarBloque(bloquesLogica.bloquesFlutter[index]['id']).then((_) {
                        setState(() {}); // Actualiza la interfaz
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditarBloques(id: bloquesLogica.bloquesFlutter[index]['id']), // Pasa el ID correcto
                        // Pasa el ID
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
