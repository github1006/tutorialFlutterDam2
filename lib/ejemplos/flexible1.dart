import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Flexible1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible"),
      ),
      body:Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                color: Colors.black26,

              ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                color: Colors.green,
                width:50,
          )),
          Flexible(
              flex: 3,
              child:
          Container(
            color: Colors.greenAccent,
            
          ))
        ],
      ),

    );
  }

}