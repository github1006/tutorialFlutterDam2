import 'package:flutter/material.dart';

class ImagenUrl extends StatelessWidget{
  Widget build(BuildContext context){
    return  Scaffold(
      body:Row(
        children: [
          Expanded(
            child:Image.network('https://avatars.githubusercontent.com/u/109951?s=400&v=4%27',
              ),
          )],
      ),
    );
  }
}