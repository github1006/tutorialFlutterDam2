import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expanded1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("lider"),
        backgroundColor:Colors.blue,

      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  "In Flutter, you can use the Expanded widget to make a child widget expand to fill the available "
                  "space within its parent widget along the main axis of a Row, Column, or Flex. The Expanded widget is often "
                  "used to distribute space proportionally among its children. This augments the lines of the content in order to look",
                  style: TextStyle(color: Colors.green, fontSize: 30),
                ),
                color: Colors.yellow,
                height: 2,
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  "In summary, Variable Expressions () are used to access variables from the current context, while Selection Variable Expressions (*{...}) are used to access properties of objects in a collection during iteration.",
                  style: TextStyle(color: Colors.yellow, fontSize: 23),
                ),
                color: Colors.red,
                height: 3,
              ))
        ],
      ),
    );
  }
}
