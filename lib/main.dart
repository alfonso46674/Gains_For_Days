import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:proyecto_integrador/login/login.dart';
import 'package:proyecto_integrador/register/register.dart';
import 'package:proyecto_integrador/splash/splash.dart';
import 'package:proyecto_integrador/utils/constants.dart';
import 'package:proyecto_integrador/wellcome/wellcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: APP_TITLE,
      theme: NeumorphicThemeData(
          baseColor: Color(0x00000000),
          lightSource: LightSource.bottom,
          depth: 2,
          intensity: 0.75),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/wellcome': (context) => Wellcome(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
      },
    );
  }
}
