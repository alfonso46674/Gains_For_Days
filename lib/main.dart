import 'package:flutter/material.dart';
import 'package:proyecto_integrador/splash/splash.dart';
import 'package:proyecto_integrador/utils/constants.dart';
import 'package:proyecto_integrador/wellcome/wellcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/wellcome': (context) => Wellcome(),
      },
    );
  }
}
