import 'package:flutter/cupertino.dart';
import 'package:projeto_imc/ui/ios/pages/home_pages.dart';
//Classe que irá rodar somente no IOS, já definida no ui/ios/pages/home_page.dart.

class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Projeto IMC em Flutter',
      debugShowCheckedModeBanner: false, //Remove o ícone de debug no app

      home: HomePage(),
    );
  }
}
