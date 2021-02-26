import 'package:flutter/material.dart';
import 'item_ejercicios.dart';

class ListaEjercicios extends StatelessWidget {
  const ListaEjercicios({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicios de abdomen"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/busquedaEjercicios');
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return ItemMenuEjercicios();
          },
        ),
      ),
    );
  }
}