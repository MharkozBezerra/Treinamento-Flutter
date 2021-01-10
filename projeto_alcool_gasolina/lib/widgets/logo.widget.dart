import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Cria-se o logo da aplicação
        SizedBox(
          height: 60,
        ),
        Image.asset(
          //Endereço da imagenm
          "assets/images/aog-white.png",
          height: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Big Shoulders Display",
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
