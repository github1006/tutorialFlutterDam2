import 'package:flutter/material.dart';
import 'package:flutter_tutorial/bloques_pantall.dart';
import 'package:flutter_tutorial/inicio.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Inicio(id: 1),
    );
  }
}
//estaba viendo este video: Create and Read Data from SQFLite using Flutter Apps | Flutter SQFLite CRUD Operation #2


