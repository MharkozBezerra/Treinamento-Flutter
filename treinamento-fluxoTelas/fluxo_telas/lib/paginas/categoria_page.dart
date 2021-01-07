import 'package:flutter/material.dart';

class CategoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categoria'),
      ),
      body: Container(
        child: FlatButton(
          onPressed: () {
            //Verifica se há telas, para ser retornada.
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/categoria',
              ModalRoute.withName("/"),
            );
          },
          child: Text("Fechar tela"),
        ),
      ),
    );
  }
}
