import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:projeto_alcool_gasolina/widgets/logo.widget.dart';
import 'package:projeto_alcool_gasolina/widgets/submit-form.widget.dart';
import 'package:projeto_alcool_gasolina/widgets/sucess.widget.dart';

class HomePage extends StatefulWidget {
  //Controle da mascarar de dinheiro para gasolina
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _cor = Colors.deepPurple;
  var _gasolinaCtrl = new MoneyMaskedTextController();
  var _alcooltCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _cor,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? SucessWidget(
                    reset: reset,
                    result: _resultText,
                  )
                : SubmiteForm(
                    gasolinaCtrl: _gasolinaCtrl,
                    alcooltCtrl: _alcooltCtrl,
                    busy: _busy,
                    func: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  ///**Calcula o  valor da soma */
  Future calculate() {
    double alc =
        double.parse(_alcooltCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;
    double gas =
        double.parse(_gasolinaCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;
    double res = alc / gas;

    //Atualiza o status da  tela
    setState(() {
      _cor = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });
    //Simula um carregamento web
    return new Future.delayed(
        const Duration(seconds: 03),
        () => {
              setState(() {
                //Realiza a mostra op estado após a  soma
                if (res >= 0.7) {
                  _resultText = "Compensa utilizar gasolina";
                } else {
                  _resultText = "Compensa utilizar álcool";
                }
                _completed = true;
                _busy = false;
              })
            });
  }

  reset() {
    setState(() {
      _gasolinaCtrl = new MoneyMaskedTextController();
      _alcooltCtrl = new MoneyMaskedTextController();
      _busy = false;
      _completed = false;
      _cor = Theme.of(context).primaryColor;
    });
  }
}
