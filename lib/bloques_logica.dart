import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial/modelo/base_datos_ayuda.dart';

class BloquesLogica {
  final BaseDatosAyuda baseDatosAyuda = BaseDatosAyuda();
  List<Map<String, dynamic>> bloquesFlutter = [];
  List<Map<String, dynamic>> conceptosFlutter = [];
  List<Map<String, dynamic>> clasesFlutter = [];
  final TextEditingController controladorBloques = TextEditingController();
  final TextEditingController controladorConceptos = TextEditingController();
  final TextEditingController controladorClases = TextEditingController();

  // Método para inicializar la base de datos y cargar los bloques y conceptos
  Future<void> iniciaBd() async {
    await baseDatosAyuda.iniciarBd(); // Inicia la base de datos
    await cargarBloques();  // Carga los bloques después de la inicialización
    await cargarConceptos();  // Carga los conceptos después de la inicialización
    await cargarClases();
  }

  // Método para cargar los bloques desde la base de datos y actualizar la lista
  Future<void> cargarBloques() async {
    bloquesFlutter = await baseDatosAyuda.cargarBloques();
    // Actualiza el TextEditingController con los datos cargados (opcional)
    controladorBloques.text = bloquesFlutter.toString();
  }

  // Método para cargar los conceptos desde la base de datos y actualizar la lista
  Future<void> cargarConceptos() async {
    conceptosFlutter = await baseDatosAyuda.cargarConceptos();
    // Actualiza el TextEditingController con los datos cargados (opcional)
    controladorConceptos.text = conceptosFlutter.toString();
  }
  // Método para cargar los clases desde la base de datos y actualizar la lista
  Future<void> cargarClases() async {
    clasesFlutter = await baseDatosAyuda.cargarClases();
    // Actualiza el TextEditingController con los datos cargados (opcional)
    controladorClases.text = clasesFlutter.toString();
  }

  // Método para añadir un nuevo bloque
  Future<void> anadirBloque(
      String nombreWidget,
      String tipoWidget,
      String propiedades,
      String descripcion,
      String codigoEjemplo,
      String videoUrl
      ) async {
    await baseDatosAyuda.anadirBloque(
      nombreWidget,
      tipoWidget,
      propiedades,
      descripcion,
      codigoEjemplo,
      videoUrl
    );
    controladorBloques.clear();
    await cargarBloques(); // Recarga los bloques para reflejar el cambio
  }

  // Método para añadir un nuevo concepto
  Future<void> anadirConcepto(
      String nombre,
      String descripcion,
      String codigoEjemplo,
      String salidaEjemplo,
      ) async {
    await baseDatosAyuda.anadirConcepto(
      nombre,
      descripcion,
      codigoEjemplo,
      salidaEjemplo,
    );
    controladorConceptos.clear();
    await cargarConceptos(); // Recarga los conceptos para reflejar el cambio
  }

  // Método para añadir un nuevo clase
  Future<void> anadirClase(
      String nombreClase,
      String tipoClase,
      String descripcion,
      String metodosPrincipales,
      String propiedadesPrincipales,
      String ejemploUso,
      String documentacionUrl,
      
      ) async {
    await baseDatosAyuda.anadirClase(
      nombreClase,
      tipoClase,
      descripcion,
      metodosPrincipales,
      propiedadesPrincipales,
      ejemploUso,
      documentacionUrl,
    );
    controladorClases.clear();
    await cargarClases(); // Recarga clases para reflejar el cambio
  }


  // Método para borrar un bloque
  Future<void> borrarBloque(int id) async {
    await baseDatosAyuda.borrarBloque(id);
    await cargarBloques(); // Recarga los bloques después de borrar
  }

  // Método para borrar un concepto
  Future<void> borrarConcepto(int id) async {
    await baseDatosAyuda.borrarConceptos(id);
    await cargarConceptos(); // Recarga los conceptos después de borrar
  }

  // Método para borrar una clase
  Future<void> borrarClase(int id) async {
    await baseDatosAyuda.borrarClase(id);
    await borrarClase(id); // Recarga los bloques después de borrar
  }
}
