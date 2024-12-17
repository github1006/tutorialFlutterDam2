class ConceptoDart {
  String nombre;
  String descripcion;
  String codigoEjemplo;
  String salidaEjemplo;

  ConceptoDart(
    this.nombre,
    this.descripcion,
    this.codigoEjemplo,
    this.salidaEjemplo,
  );
}

List<ConceptoDart> dataDart=[
  ConceptoDart('variables',
      '''
  En Dart, las variables son elementos fundamentales para almacenar y manipular datos. 
  Declaración de Variables: Puedes declarar una variable en Dart utilizando la palabra clave var, seguida del nombre de la variable y opcionalmente su tipo, seguido de un signo igual = y el valor inicial de la variable. 
  ''',  '''
  var nombre='Tom';
  print(variable.dart); ''', 'Tom'),

  ConceptoDart('tiposDatos',
    '''
  Dart tiene varios tipos de datos primitivos, incluyendo:
  - `int`: Para números enteros.
  - `double`: Para números con punto decimal.
  - `String`: Para cadenas de texto.
  - `bool`: Para valores booleanos (true o false).
  
  Estos tipos de datos son fundamentales para manipular información en Dart.
  ''',
    '''
  int edad = 25;
  double altura = 1.75;
  String nombre = 'Tom';
  bool esEstudiante = true;
  print(edad)
  ''',
    '25',
  ),

  ConceptoDart('Listas',
    '''
  Las listas son colecciones ordenadas de elementos que pueden ser de diferentes tipos. Se pueden modificar dinámicamente, lo que significa que puedes agregar, eliminar o cambiar elementos después de que se han creado.

  Puedes crear una lista utilizando corchetes `[]` y separar los elementos con comas.
  ''',
    '''
  List<String> frutas = ['Manzana', 'Banana', 'Naranja'];
  print(frutas[0]); // Salida: Manzana
  ''',
    'Manzana',
  ),
  ConceptoDart('Mapas',
    '''
  Un mapa es una colección de pares clave-valor donde cada clave es única. Los mapas son útiles para almacenar datos relacionados y se declaran utilizando llaves `{}`.

  Puedes acceder a los valores utilizando su clave.
  ''',
    '''
  Map<String, String> capitales = {
    'España': 'Madrid',
    'Francia': 'París',
    'Alemania': 'Berlín',
  };
  print(capitales['Francia']); // Salida: París
  ''',
    'París',
  ),
  ConceptoDart('Funciones',
    '''
  Las funciones son bloques de código reutilizables que realizan una tarea específica. En Dart, puedes definir una función utilizando la palabra clave `void` para funciones que no retornan un valor, o especificar un tipo de retorno.

  Puedes pasar argumentos a las funciones y, opcionalmente, devolver un valor.
  ''',
    '''
  void saludar(String nombre) {
    print('Hola, \$nombre');
  }
  
  saludar('Tom'); // Salida: Hola, Tom
  ''',
    'Hola, Tom',
  ),

  ConceptoDart('Condicionales',
    '''
  Los condicionales son estructuras que permiten ejecutar diferentes bloques de código según si una condición es verdadera o falsa. Dart utiliza `if`, `else if`, y `else` para crear condicionales.

  Estas estructuras son fundamentales para controlar el flujo de la aplicación.
  ''',
    '''
  int numero = 10;
  if (numero > 0) {
    print('El número es positivo');
  } else {
    print('El número es negativo o cero');
  }
  ''',
    'El número es positivo',
  ),


];