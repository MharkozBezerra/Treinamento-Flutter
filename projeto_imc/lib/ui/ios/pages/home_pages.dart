import 'package:flutter/cupertino.dart';
import 'package:projeto_imc/blocks/imc_block.dart';
//Classe que irá rodar somente no IOS, já definida no main.dart.

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Instamcia a classe blocks
  var bloc = new ImcBloc();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Calculo do IMC"),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: "Altura (cm)",
              controller: bloc.heightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: "Peso (kg)",
              controller: bloc.weightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              bloc.result,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoButton.filled(
              //color: Theme.of(context).primaryColor,
              child: Text("Calcular"),
              onPressed: () {
                setState(() {
                  bloc.calculate();
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
