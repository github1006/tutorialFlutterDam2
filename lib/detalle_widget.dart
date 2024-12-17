import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ejemplos/centro.dart';
import 'package:flutter_tutorial/ejemplos/columna.dart';
import 'package:flutter_tutorial/ejemplos/defaultTabControllerEjemplo.dart';
import 'package:flutter_tutorial/ejemplos/imagen.dart';
import 'package:flutter_tutorial/ejemplos/imagenUrl.dart';
import 'package:flutter_tutorial/ejemplos/tajeta1.dart';
import 'package:flutter_tutorial/ejemplos/targeta2.dart';
import 'package:flutter_tutorial/modelo/base_datos_ayuda.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Importa el paquete para reproducir YouTube
import 'ejemplos/botones.dart';
import 'ejemplos/flexible1.dart';
import 'ejemplos/scafold.dart';
import 'ejemplos/singleChildScrollViewEjemplo.dart'; // Asegúrate de ajustar la ruta correctamente.

class ZoomCodigo extends StatefulWidget {
  final String texto;
  const ZoomCodigo({super.key, required this.texto});


  @override
  _ZoomCodigoState createState() => _ZoomCodigoState();
}

class _ZoomCodigoState extends State<ZoomCodigo> {
  double _fontSize = 18; // Tamaño de fuente inicial
  double _scaleFactor = 1.0; // Factor de escala inicial

  void _onScaleStart(ScaleStartDetails details) {
    _scaleFactor = _fontSize / 24;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _fontSize = 24 * _scaleFactor * details.scale;
      _fontSize = _fontSize.clamp(12.0, 100.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      child: Container(
        alignment: Alignment.center,
        color: Colors.white70,
        child: Text(
          widget.texto,
          style: TextStyle(fontSize: _fontSize),
        ),
      ),
    );
  }
}

class DetalleWidget extends StatefulWidget {
  final String nombreWidget;
  final String tipoWidget;
  final String propiedades;
  final String descripcion;
  final String codigoEjemplo;
  final String videoUrl;

  const DetalleWidget({
    super.key,
    required this.nombreWidget,
    required this.tipoWidget,
    required this.propiedades,
    required this.descripcion,
    required this.codigoEjemplo,
    required this.videoUrl,
  });

  @override
  _DetalleWidgetState createState() => _DetalleWidgetState();
}


class _DetalleWidgetState extends State<DetalleWidget> {
  late YoutubePlayerController _videoUrlController; //_controladorVideo renamed
  bool _estaPantallaCompleta = false;
  Map<String, dynamic>? widgetData; //de tabla

  @override
  void initState() {
    super.initState();
    _fetchWidgetData();

    _videoUrlController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: true,
        mute: false,
        hideControls: false,
        forceHD: true,
      ),
    );

    _videoUrlController.addListener(() {
      if (_videoUrlController.value.isFullScreen != _estaPantallaCompleta) {
        setState(() {
          _estaPantallaCompleta = _videoUrlController.value.isFullScreen;
        });
      }
    });
  }

  Future<void> _fetchWidgetData() async { //consulta a base de datos
    final data = await BaseDatosAyuda().obtenerDetalleWidget(widget.nombreWidget);
    if (data != null) {
      setState(() {
        widgetData = data;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Widget no encontrado en la base de datos')),
      );
    }
  }

 /* /// Método para ejecutar acciones según el contenido de `codigoEjemplo desde la base de datos`.
  void _ejecutarCodigoEjemplo() {
    if (widgetData?['codigoEjemplo'] != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ZoomCodigo(texto: widgetData!['codigoEjemplo']),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay ejemplo disponible para este widget')),
      );
    }
  }
*/
  @override
  void dispose() {
    _videoUrlController.dispose();
    super.dispose();
  }

  /// Método para ejecutar acciones según el nombre del widget sin base de datos
  void ejecutarEjemploSegunNombre() {
    switch (widget.nombreWidget) {
      case 'Image':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Imagen()),
        );
        break;
      case 'Scaffold':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Escafold()),
        );
        break;
      case 'Column':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Columna()),
        );
        break;
      case 'Card':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Tarjeta2()),
        );
        break;
      case 'Flexible':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Flexible1()),
        );
        break;
      case 'Button':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Boton()),
        );
        break;
      case 'DefaultTabController':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ControladorPestanasDefecto()),
        );
        break;
      case 'SingleChildScrollView':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VistaDesplazableConUnSoloHijo()),
        );
        break;
      case 'Center':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Centro()),
        );
        break;


      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No se encontró un ejemplo para "${widget.nombreWidget}".',
            ),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de widget ${widget.nombreWidget}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Nombre: ${widget.nombreWidget}',
                  style: const TextStyle(fontSize: 30),
                ),
                subtitle: Text('Tipo: ${widget.tipoWidget}'),
              ),
              Text(
                'Descripción: ${widget.descripcion}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Propiedades: ${widget.propiedades}',
                style: const TextStyle(fontSize: 18),
              ),
              ZoomCodigo(texto: widget.codigoEjemplo),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: ejecutarEjemploSegunNombre,
                child: const Text('Ejecutar Ejemplo'),
              ),
              YoutubePlayer(
                controller: _videoUrlController,
                showVideoProgressIndicator: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
