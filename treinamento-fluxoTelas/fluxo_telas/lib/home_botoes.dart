import 'package:flutter/material.dart';
import 'package:fluxo_telas/paginas/produto_page.dart';
import 'package:fluxo_telas/paginas/categoria_page.dart';

class HomeBotoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegação'),
      ),
      body: Container(
        //Ocupa toda tela.
        width: double.infinity,
        child: Column(
          //Alinhamento ao centro
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                /*-> Modo 1 de tela*/
                //push = Flutter cria uma nova página por cima da atual
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => ProdutoPage(),
                // ));
                /*-> Modo 2 de tala */
                //pushAndRemoveUntil = Ao clicar no botão, o Flutter remove as telas até chegar na desejada.
                // Remova até X tela
                //Navigator.of(context).pushAndRemoveUntil(
                //    MaterialPageRoute(
                //      builder: (context) =>
                //        ProdutoPage(), //Define a tela desejada
                //    ),
                //    (route) => false);
                /**Navehação por rotas definidas no main.dart */
                //Modo 3 :pré configurado no home ou arquivo central da aplicação.
                Navigator.of(context)
                    .pushNamed('/produtos'); // Semelhante ao modo 1
              },
              child: Text("Produtos"),
            ),
            RaisedButton(
                child: Text("Categoria"),
                onPressed: () {
                  //Navigator.of(context).pushNamedAndRemoveUntil(
                  //    '/categoria', (route) => false); //Semelhante ao modo 2
                  // Modo 2 melhorado
                  //Vai remover até chegar na raiz da tela
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/categoria', ModalRoute.withName("/"));
                })
          ],
        ),
      ),
    );
  }
}
