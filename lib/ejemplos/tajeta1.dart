import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tarjeta1 extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
            child: Card(
              elevation: 1,
              child: Row(
                children: [
                  Image.network('https://avatars.githubusercontent.com/u/109951?s=400&v=4%27',
                    width: 100,),
                  Container(
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Insertar una imagen desde una url es mucho mas sencillo que agregar desde un asset, Basta utilizar el Widget NetworkImage y pasar como parametro la Url de la imagen"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
            child: Card(
              elevation: 1,
              child: Row(
                children: [
                  Image.network('https://static.dezeen.com/uploads/2022/06/meta-avatars-store-fashion-design-technology_dezeen_2364_col_1-1704x959.jpg',
                    width: 100,),
                  Container(
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Insertar una imagen desde una url es mucho mas sencillo que agregar desde un asset, Basta utilizar el Widget NetworkImage y pasar como parametro la Url de la imagen"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
            child: Card(
              elevation: 1,
              child: Row(
                children: [
                  Image.network('https://forkast.news/wp-content/uploads/2022/03/NFT-Avatar.png',
                    width: 100,),
                  Container(
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Insertar una imagen desde una url es mucho mas sencillo que agregar desde un asset, Basta utilizar el Widget NetworkImage y pasar como parametro la Url de la imagen"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}