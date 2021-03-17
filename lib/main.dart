import 'package:flutter/material.dart';
import 'package:prova_flutter_diegoguinea/screens/EditarPerfil.dart';
import 'package:prova_flutter_diegoguinea/screens/EquipoCocina.dart';
import 'package:prova_flutter_diegoguinea/screens/GourmetDelivery.dart';
import 'package:prova_flutter_diegoguinea/screens/Loguin.dart';
import 'package:prova_flutter_diegoguinea/screens/ajustes.dart';
import 'package:prova_flutter_diegoguinea/screens/cambiarContra.dart';
import 'package:prova_flutter_diegoguinea/screens/carrito.dart';
import 'package:prova_flutter_diegoguinea/screens/historial.dart';
import 'package:prova_flutter_diegoguinea/screens/infoApp.dart';
import 'package:prova_flutter_diegoguinea/screens/informacion.dart';
import 'package:prova_flutter_diegoguinea/screens/inicio.dart';
import 'package:prova_flutter_diegoguinea/screens/pago.dart';
import 'package:prova_flutter_diegoguinea/screens/perfil.dart';
import 'package:prova_flutter_diegoguinea/screens/recuperar.dart';
import 'package:prova_flutter_diegoguinea/screens/signup.dart';
import 'package:prova_flutter_diegoguinea/screens/tarjeta.dart';
import 'package:prova_flutter_diegoguinea/utils/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Loguin(),
        routes: <String, WidgetBuilder>{
          Routes.inicio:  (BuildContext context) => new FirstPage(),
          Routes.gourmet:  (BuildContext context) => new GourmetDelivery(),
          Routes.equipo:  (BuildContext context) => new EquipoCocina(),
          Routes.info:  (BuildContext context) => new InfoPage(),
          Routes.loguin: (BuildContext context) => new Loguin(),
          Routes.signup: (BuildContext context) => new Signup(),
          Routes.recuperar: (BuildContext context) => new Recuperar(),
          Routes.perfil: (BuildContext context) => new Perfil(),
          Routes.ajustes: (BuildContext context) => new Ajustes(),
          Routes.editarPerfil: (BuildContext context) => new EditarPerfil(),
          Routes.cambiarContra: (BuildContext context) => new CambiarContra(),
          Routes.infoApp: (BuildContext context) => new InfoApp(),
          Routes.carrito: (BuildContext context) => new Carrito(),
          Routes.pago: (BuildContext context) => new Pago(),
          Routes.tarjeta: (BuildContext context) => new Tarjeta(),
          Routes.historial: (BuildContext context) => new Historial(),
        }
    );
  }
}

