import 'package:flutter/material.dart';
import 'package:projeto_imc/blocks/imc_block.dart';

//Classe que irá rodar somente no Android, já definida no main.dart.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new ImcBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo IMC'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: bloc.heightCtrl,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: bloc.weightCtrl,
              decoration: InputDecoration(
                labelText: "Peso (Kg)",
              ),
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
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                "Calcular",
                style: TextStyle(color: Colors.white),
              ),
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
