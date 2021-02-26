import 'package:flutter/material.dart';

class ItemMenuEjercicios extends StatefulWidget {
  ItemMenuEjercicios({Key key}) : super(key: key);

  @override
  _ItemMenuEjerciciosState createState() => _ItemMenuEjerciciosState();
}

class _ItemMenuEjerciciosState extends State<ItemMenuEjercicios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(child: ListTile(leading:FlutterLogo(),title: Text("Abdomen"),)),
    );
  }
}
