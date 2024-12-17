import 'package:flutter/material.dart';
import 'package:flutter_tutorial/bloques_logica.dart';
import 'package:flutter_tutorial/editarBloques.dart';

class ListaWidget extends StatefulWidget {
  final int id; // ID del bloque
  const ListaWidget({super.key, required this.id}); // Constructor

  @override
  _ListaWidgetState createState() => _ListaWidgetState();
}

class _ListaWidgetState extends State<ListaWidget> {//permite que _ListaWidgetState acceda a las propiedades y métodos del widget ListaWidget
  final BloquesLogica bloquesLogica = BloquesLogica();

  @override
  void initState() {
    super.initState();
    bloquesLogica.iniciaBd().then((_) {
      setState(() {}); // Actualiza la interfaz una vez cargada la base de datos
    });
    print("Base de datos inicializada");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
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
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
