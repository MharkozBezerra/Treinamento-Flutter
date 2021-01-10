import 'package:flutter/material.dart';
import 'package:projeto_alcool_gasolina/widgets/loading-button.widget.dart';

class SucessWidget extends StatelessWidget {
  var result = "";
  Function reset;
  SucessWidget({
    @required this.result,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            result, // -<- Descreve se  o resultado
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          //Aqui vai um botão, calcular novamente.
          BotaoCarregar(
            busy: false,
            func: reset,
            text: "CALCULAR NOVAMENTE",
            invert: true,
          ),
        ],
      ),
    );
  }
}
