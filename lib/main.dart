import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:proyecto_integrador/ejercicios/busqueda_ejercicios.dart';
import 'package:proyecto_integrador/ejercicios/menu_ejercicios.dart';
import 'package:proyecto_integrador/login/login.dart';
import 'package:proyecto_integrador/register/register.dart';
import 'package:proyecto_integrador/rutinas/mis_rutinas.dart';
import 'package:proyecto_integrador/splash/splash.dart';
import 'package:proyecto_integrador/utils/constants.dart';
import 'package:proyecto_integrador/welcome/welcome.dart';

import 'ejercicios/details_ejercicios.dart';
import 'ejercicios/lista_ejercicios.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/welcome': (context) => Welcome(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => MenuEjercicios(),
        '/listaEjercicios': (context) => ListaEjercicios(),
        '/detailsEjercicios': (context) => DetailsEjercicios(),
        '/busquedaEjercicios': (context) => BusquedaEjercicios(),
        '/misRutinas':(context) => MisRutinas(),
      },
    );
  }
}
