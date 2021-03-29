import 'package:flutter/material.dart';
import 'package:proyecto_integrador/utils/constants.dart'; 

class MisRutinas extends StatefulWidget {
  MisRutinas({Key key}) : super(key: key);

  @override
  _MisRutinasState createState() => _MisRutinasState();
}

//TODO: Hacer que las rutinas que aparecen salgan a partir de la BD y que se generen widgets GestureDetector dinamicamente
class _MisRutinasState extends State<MisRutinas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis rutinas"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: ListTile(
                      leading: FlutterLogo(),
                      title: Text("Rutina Abdomen y Pierna"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: BLUE_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: Text(
                  'CREAR RUTINA',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/crearRutina');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
