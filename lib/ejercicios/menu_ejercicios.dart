import 'package:flutter/material.dart';
import 'item_menu_ejercicios.dart';


class MenuEjercicios extends StatelessWidget {
  const MenuEjercicios({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicios"),),
      body: Container(child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
        return ItemMenuEjercicios() ;
       },
      ),),
    );
  }
}