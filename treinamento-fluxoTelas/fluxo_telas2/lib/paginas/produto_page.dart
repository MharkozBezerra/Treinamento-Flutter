import 'package:flutter/material.dart';

class ProdutoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: Container(
        child: FlatButton(
          onPressed: () {
            //Verifica se há telas, para ser retornada.
            if (Navigator.of(context).canPop()) {
              //Remove a tela da memória, e retorna a tela raiz
              Navigator.of(context).pop();
            } else {
              print("Não foi possível voltar!!!");
            }
          },
          child: Text("TFechar tela"),
        ),
      ),
    );
  }
}
