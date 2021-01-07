import 'package:flutter/material.dart';
import 'package:projeto_imc/ui/android/pages/home_page.dart';

//Classe que irá rodar somente no Android, já definida no ui/android/pages/home_page.dart.
class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto IMC em Flutter',
      debugShowCheckedModeBanner: false, //Remove o ícone de debug no app
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
