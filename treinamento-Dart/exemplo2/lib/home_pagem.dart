import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Barra principal do app
        appBar: AppBar(
          title: Text(
            'Mharkoz Bezerra',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          ),
          actions: [
            Center(
              child: Text("opção 1"),
            ),
            Center(
              child: Text("opção 2"),
            )
          ],
        ),
        //Menu Hamburguer
        drawer: Drawer(),
        body: Container(
          child: Text("Olá Mundo!!!"),
        ));
  }
}
