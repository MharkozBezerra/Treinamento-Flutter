import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CaixaTexto extends StatelessWidget {
  var label = "";
  var ctrl = new MoneyMaskedTextController();

  //Contrutor da classe
  CaixaTexto({@required this.label, @required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            label, //<- descrição da mensagem que será apresenta
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: "Big Shoulders Display",
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: ctrl, // <- id do TextFormFilde
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontFamily: "Big Shoulders Display",
            ),
            //Remove a borda do input text
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
