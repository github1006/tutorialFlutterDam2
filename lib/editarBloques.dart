import 'package:flutter/material.dart';
import 'detalle_widget.dart';
import 'modelo/base_datos_ayuda.dart'; // Asegúrate de importar la clase BaseDatosAyuda

class EditarBloques extends StatefulWidget {
  final int id; // ID del bloque a editar

  // Constructor
  const EditarBloques({super.key, required this.id});

  @override
  _EditarBloquesState createState() => _EditarBloquesState();
}

class _EditarBloquesState extends State<EditarBloques> {
  String nombreWidget = '';
  String tipoWidget = '';
  String propiedades = '';
  String descripcion = '';
  String codigoEjemplo = '';
  String videoUrl = '';

  final BaseDatosAyuda baseDatosAyuda = BaseDatosAyuda();


  @override
  void initState() {
    super.initState();
    _cargarDatos(); // Cargar datos del bloque en initState
  }

  Future<void> _cargarDatos() async {
    await baseDatosAyuda.asegurarInicializacion(); // Asegurarse de que la base de datos esté inicializada
    List<Map<String, dynamic>> bloques = await baseDatosAyuda.cargarBloques();

    // Busca el bloque específico usando el ID
    final bloque = bloques.firstWhere((element) => element['id'] == widget.id, orElse: () => {});

    if (bloque.isNotEmpty) {
      setState(() {
        nombreWidget = bloque['nombreWidget'];
        tipoWidget = bloque['tipoWidget'];
        propiedades = bloque['propiedades'];
        descripcion = bloque['descripcion'];
        codigoEjemplo = bloque['codigoEjemplo'];
        videoUrl = bloque['videoUrl'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar bloques"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Nombre del Widget'),
              controller: TextEditingController(text: nombreWidget),
              onChanged: (value) {
                nombreWidget = value; // Actualiza el nombre del widget
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Tipo del Widget'),
              controller: TextEditingController(text: tipoWidget),
              onChanged: (value) {
                tipoWidget = value; // Actualiza el tipo del widget
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Propiedades'),
              controller: TextEditingController(text: propiedades),
              onChanged: (value) {
                propiedades = value; // Actualiza las propiedades
              },
              maxLines: 4,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Descripción'),
              controller: TextEditingController(text: descripcion),
              onChanged: (value) {
                descripcion = value; // Actualiza la descripción
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Código de Ejemplo'),
              controller: TextEditingController(text: codigoEjemplo),
              onChanged: (value) {
                codigoEjemplo = value; // Actualiza el código de ejemplo
              },
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes implementar la lógica para guardar los cambios en la base de datos
                    baseDatosAyuda.actualizarBloque(widget.id, nombreWidget, tipoWidget, propiedades, descripcion, codigoEjemplo, videoUrl);
                    Navigator.pop(context); // Regresar a la pantalla anterior si es necesario
                  },
                  child: const Text("Guardar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navega a DetallesWidget y pasa los parámetros
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleWidget(
                          nombreWidget: nombreWidget,
                          tipoWidget: tipoWidget,
                          propiedades: propiedades,
                          descripcion: descripcion,
                          codigoEjemplo: codigoEjemplo,
                          videoUrl:videoUrl,
                        ),
                      ),
                    );
                  },
                  child: const Text('Ir a Detalles'),
                ),
                /*ElevatedButton(
                  onPressed: () {
                    // Navega a DetallesWidget y pasa los parámetros
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleWidget(
                          nombreWidget: nombreWidget,
                          tipoWidget: tipoWidget,
                          propiedades: propiedades,
                          descripcion: descripcion,
                          codigoEjemplo: codigoEjemplo,
                        ),
                      ),
                    );
                  },
                  child: const Text('Ver'),
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
