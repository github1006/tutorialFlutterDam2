import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BaseDatosAyuda {
  Database? baseDatos;

  // Inicializar bd
  Future<void> iniciarBd() async {
    final path = join(await getDatabasesPath(), 'tutorialflutter2.db');

    baseDatos = await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE bloques(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombreWidget TEXT,
          tipoWidget TEXT,
          propiedades TEXT,
          descripcion TEXT,
          codigoEjemplo TEXT,
          videoUrl TEXT,
        )''',
        );
        await db.execute(
          '''CREATE TABLE conceptos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          descripcion TEXT,
          codigoEjemplo TEXT,
          salidaEjemplo TEXT,
          videoUrl
        )''',
        );
        await db.execute('''
          CREATE TABLE clases(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombreClase TEXT NOT NULL,
            tipoClase TEXT,
            descripcion TEXT,
            metodosPrincipales TEXT,
            propiedadesPrincipales TEXT,
            ejemploUso TEXT,
            documentacionUrl TEXT
          )
          ''');
          // Aquí puedes agregar más condiciones para manejar otras actualizaciones de versiones
        },
      version: 1,
    );
  }

  // Método para asegurar que la base de datos esté inicializada
  Future<void> asegurarInicializacion() async {
    if (baseDatos == null) {
      await iniciarBd();
    }
  }
  // Método para cargar bloques
  Future<List<Map<String, dynamic>>> cargarBloques() async {
    await asegurarInicializacion(); // Llama asegurar la inicialización
    return await baseDatos!.query('bloques'); //consulta SELECT * FROM bloques;
  }
  // Método para cargar conceptos
  Future<List<Map<String, dynamic>>> cargarConceptos() async {
    await asegurarInicializacion(); // Llama asegurar la inicialización
    return await baseDatos!.query('conceptos');
  }
  // Método para cargar clases
  Future<List<Map<String, dynamic>>> cargarClases() async {
    await asegurarInicializacion();
    return await baseDatos!.query('clases');
  }

  // Método para añadir un nuevo bloque
  Future<void> anadirBloque(String nombreWidget, String tipoWidget, String prodiedades, String descripcion, String codigoEjemplo, String videoUrl ) async {
    await asegurarInicializacion();
    await baseDatos!.insert(
      'bloques',
      {
        'nombreWidget': nombreWidget,
        'tipoWidget': tipoWidget,
        'propiedades': prodiedades,
        'descripcion': descripcion,
        'codigoEjemplo': codigoEjemplo,
        'videoUrl': videoUrl
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Método para añadir un nuevo concepto
  Future<void> anadirConcepto(String nombre, String descripcion, String codigoEjemplo, String salidaEjemplo) async {
    await asegurarInicializacion();
    await baseDatos!.insert(
      'conceptos',
      {
        'nombre': nombre,
        'descripcion': descripcion,
        'codigoEjemplo': codigoEjemplo,
        'salidaEjemplo': salidaEjemplo
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Método para añadir una clase
  Future<void> anadirClase(
      String nombreClase,
      String tipoClase,
      String descripcion,
      String metodosPrincipales,
      String propiedadesPrincipales,
      String ejemploUso,
      String documentacionUrl,
      ) async {
    await asegurarInicializacion();
    await baseDatos!.insert(
      'clases',
      {
        'nombreClase': nombreClase,
        'tipoClase': tipoClase,
        'descripcion': descripcion,
        'metodosPrincipales': metodosPrincipales,
        'propiedadesPrincipales': propiedadesPrincipales,
        'ejemploUso': ejemploUso,
        'documentacionUrl': documentacionUrl
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  //metodo para borrar
  Future<void> borrarBloque(int id) async {
    await baseDatos!.delete('bloques', where: 'id = ?', whereArgs: [id]);
  }
  //metodo para borrar conceptos
  Future<void> borrarConceptos(int id) async {
    await baseDatos!.delete('conceptos', where: 'id = ?', whereArgs: [id]);
  }
  // Método para borra una clase
  Future<void> borrarClase(int id) async {
    await baseDatos!.delete('clases', where: 'id = ?', whereArgs: [id]);
  }

  // metodo para editar
  Future<void> actualizarBloque(int id, String nombreWidget, String tipoWidget, String propiedades, String descripcion, String codigoEjemplo, String videoUrl) async {
    await baseDatos!.update(
      'bloques',
      {
        'nombreWidget': nombreWidget,
        'tipoWidget': tipoWidget,
        'propiedades': propiedades,
        'descripcion': descripcion,
        'codigoEjemplo': codigoEjemplo,
        'videoUrl': videoUrl
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  //Métodos para editar o actualizar una clase
  Future<void> actualizarClase(
      int id,
      String nombreClase,
      String tipoClase,
      String descripcion,
      String metodosPrincipales,
      String propiedadesPrincipales,
      String ejemploUso,
      String documentacionUrl,
      ) async {
    await baseDatos!.update(
      'clases',
      {
        'nombreClase': nombreClase,
        'tipoClase': tipoClase,
        'descripcion': descripcion,
        'metodosPrincipales': metodosPrincipales,
        'propiedadesPrincipales': propiedadesPrincipales,
        'ejemploUso': ejemploUso,
        'documentacionUrl': documentacionUrl
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Método para obtener los detalles de un widget específico (por nombre)
  Future<Map<String, dynamic>?> obtenerDetalleWidget(String nombreWidget) async {
    await asegurarInicializacion(); // Asegura que la base de datos está inicializada

    // Realiza la consulta en la tabla 'bloques' para obtener los detalles del widget por su nombre
    List<Map<String, dynamic>> result = await baseDatos!.query(
      'bloques',
      where: 'nombreWidget = ?', // Filtra por el nombre del widget
      whereArgs: [nombreWidget], // Pasa el nombre del widget como argumento
    );

    // Si hay resultados, devuelve el primer registro encontrado
    if (result.isNotEmpty) {
      return result.first;
    }

    // Si no se encuentran resultados, retorna null
    return null;
  }

}
