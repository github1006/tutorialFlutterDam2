import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Columna extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                print(Text("Presiono Tomas")
                );
                }, child: Text("Botoncito")
              ),
              ElevatedButton(onPressed: (){
                print(Text("Presiono Tomas")
                );
              }, child: Text("Botonaso")
              ),
              ElevatedButton(onPressed: (){
                print(Text("Presiono Tomas")
                );
              }, child: Text("Botonaso")
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                print(Text("Presiono Tomas")
                );
              }, child: Text("Botoncito")
              ),
              ElevatedButton(onPressed: (){
                print(Text("Presiono Tomas")
                );
              }, child: Text("Botonaso")
              ),
              ElevatedButton(onPressed: (){
                print(Text("Presiono Tomas")
                );
              }, child: Text("Botonaso")
              ),
            ],
          )
        ],
      ),
    );
  }
}