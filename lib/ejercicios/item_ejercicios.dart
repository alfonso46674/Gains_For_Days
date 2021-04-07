import 'package:flutter/material.dart';
import 'package:proyecto_integrador/ejercicios/details_ejercicios.dart';
import 'package:proyecto_integrador/models/exercise.dart';

class ItemMenuEjercicios extends StatefulWidget {
  final Exercise ejercicio;
  ItemMenuEjercicios({
    Key key,
    @required this.ejercicio,
  }) : super(key: key);

  @override
  _ItemMenuEjerciciosState createState() => _ItemMenuEjerciciosState();
}

class _ItemMenuEjerciciosState extends State<ItemMenuEjercicios> {
  bool isNewRouteSameAsCurrent = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Card(
            child: ListTile(
          leading: Image.asset(
            'assets/misc/dummy-square.png',
            width: 64,
            height: 64,
          ),
          title: Text("${widget.ejercicio.name}"),
        )),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => DetailsEjercicios(
                      ejercicio: widget.ejercicio,
                    )),
          );
        },
      ),
    );
  }
}
