class Bloques {
  String nombreWidget;
  String tipoWidget;
  String propiedades;
  String descripcion;
  String codigoEjemplo;
  String videoUrl;
  Bloques(
      this.nombreWidget,
      this.tipoWidget,
      this.propiedades,
      this.descripcion,
      this.codigoEjemplo,
      this.videoUrl
      );
}
List<Bloques> data=[
  Bloques('Text', 'StatelessWidget','''
  style, 
  textAlign: center, justified
  maxLines: Lo de mas será truncado.
  Overflow
  fit, repeat''',
  '''
  Muestra el texto que de forma opcionas se puede formatear
  ''', '''
  class Texto extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Text('Hola soy un texto')
        ],
      )
    );
  }
}
 ''', 'https://www.youtube.com/watch?v=w-Ys1sdxWFw'),

  Bloques('Image', 'StatelessWidget',
      '''
      height/width, aligment, fit y mas...
  ''',
      '''
  Soporta jpg, png, gif, webP, BMP, y WVMP, puede leer de asset, file, momory, network    
  ''', '''
  class Imagen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
        body:Row(
          children: [
            Expanded(child:
            Image.asset('assets/img/pupu1.jpg', height: 900)
            )
          ],
        ),
    );
  }
}
  ''','https://www.youtube.com/watch?v=3IErgrKtzhc'),
  Bloques('Button', 'StatelessWidget', '''Propiedades: onPressed, ''', 'Permite realizar una acción, hay flatButton y raisedButton',
      '''
      class Boton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                print("Tomas Alvarez");
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  backgroundColor: Colors.amber),
              child: Text("TOMAS BOTON")),
        ));
  }
}
  ''', 'https://www.youtube.com/watch?v=CSl2Yu2l-hc'),
  Bloques('DefaultTabController', 'StatefulWidget', '''Propiedades: length, initialIndex,child, vsync ''',
      '''
  Controlador de pestañas. Administra el índice de pestañas, 
  ''',
      '''
  class ControladorPestanasDefecto extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Tutorial de Flutter')),
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Intro'),),
              Tab(child: Text('Widget Básicos')),
              Tab(child: Text('De navegación')),
            ],
          ),
        ),
        body: TabBarView(
          children:[
            Intro(), // Pasar queEsFlutter a Intro2
            Lista(),
            DeNavegacion()
          ],
        ),
      ),
      initialIndex: 2,
    );
  }
}
  ''', 'https://www.youtube.com/watch?v=POtoEH-5l40'),
  Bloques('SingleChildScrollView', 'Tipo: StatelessWidget', '''Propiedades: child, scrollDirection, padding''', 'Descripcion:Permite desplazar contenido', '''
  class EjemploSingleScrollView extends StatelessWidget{
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Descripción de SingleChildScrollView'),
        ),
        body: SingleChildScrollView(
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
            ],
          ),
        ),
      ),
    );
  }
}
  ''', 'https://www.youtube.com/watch?v=ZCm-kXUPLfI'),
  Bloques('Scaffold', 'StatefulWidget', '''appBar, body, drawer, bottomNavigationBar, floatingActionButton, backgroundColor, bottomSheet, persistenFooterButtons, resizeToAvoidBottomInset''', '''
- appBar: Proporciona una barra de aplicaciones en la parte superior de la pantalla.
- body: El área principal del contenido de la aplicación.
- drawer: Un panel de navegación lateral que se desliza desde el borde izquierdo.
- bottomNavigationBar: Un widget que aparece en la parte inferior de la pantalla, generalmente una barra de navegación.
- floatingActionButton: Un botón de acción flotante.
- backgroundColor: El color de fondo de la aplicación.
- bottomSheet: Un widget que aparece en la parte inferior de la pantalla, generalmente un panel que se desliza hacia arriba.
- persistentFooterButtons: Una lista de botones que permanecen en la parte inferior de la pantalla.
- resizeToAvoidBottomInset: Indica si el cuerpo debe redimensionarse cuando aparece el teclado en pantalla.
  ''', '''
  class Escafold extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Scaffold')
        ),
      bottomNavigationBar:BottomNavigationBar(
        items: [
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
      body: Column(
        children: [
          Text('
      El Scaffold es un widget fundamental en Flutter que proporciona una estructura de diseño coherente y fácil de usar para las aplicaciones. Facilita la implementación de una interfaz de usuario consistente siguiendo las directrices de Material Design, permitiendo a los desarrolladores centrarse en la funcionalidad y el contenido de la aplicación.
      ', style: TextStyle(fontSize: 28),)
        ],
      ),
    );
    
  }
}
  ''', 'https://www.youtube.com/watch?v=C5lpPjoivaw'),


];
