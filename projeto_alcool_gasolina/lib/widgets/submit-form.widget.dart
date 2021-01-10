import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:projeto_alcool_gasolina/widgets/input.widget.dart';
import 'package:projeto_alcool_gasolina/widgets/loading-button.widget.dart';

class SubmiteForm extends StatelessWidget {
//Controle da mascarar de dinheiro para gasolina
  var gasolinaCtrl = new MoneyMaskedTextController();
  //Controle da mascarar de dinheiro para álcool
  var alcooltCtrl = new MoneyMaskedTextController();

  var busy = false;
  Function func;

  SubmiteForm({
    @required this.gasolinaCtrl,
    @required this.alcooltCtrl,
    @required this.busy,
    @required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          //Cria-se uma linha  para inserir os dados
          child: CaixaTexto(
            ctrl: gasolinaCtrl,
            label: "Gasolina: ",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          //Cria-se uma linha  para inserir os dados
          child: CaixaTexto(
            ctrl: alcooltCtrl,
            label: "Álcool: ",
          ),
        ),
        SizedBox(
          height: 25,
        ),
        BotaoCarregar(
          busy: busy,
          func: func,
          text: "CALCULAR",
          invert: false,
        ),
      ],
    );
  }
}
