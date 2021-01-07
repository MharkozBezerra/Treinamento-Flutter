import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:projeto_imc/ui/android/material_app.dart';
import 'package:projeto_imc/ui/ios/cupertino_ios.dart';

void main() {
  //Verifica qual tipo de O.S o aplicativo está sendo rodado
  /**
  * ! Verificação comum
  *
  *if (Platform.isAndroid) {
  *  return runApp(MyMaterialApp());
  *} else {
  *  return runApp(MyCupertinoApp());
  *}
  */
  verificaSistemaOperacional();
}

//Verificação resuzida.
void verificaSistemaOperacional() =>
    Platform.isAndroid ? runApp(MyMaterialApp()) : runApp(MyCupertinoApp());
