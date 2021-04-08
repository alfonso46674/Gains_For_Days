import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:proyecto_integrador/models/exercise.dart';
import 'package:proyecto_integrador/repositories/enumerations.dart';

class DetailsEjercicios extends StatefulWidget {
  final Exercise ejercicio;
  DetailsEjercicios({
    this.ejercicio,
    Key key,
  }) : super(key: key);

  @override
  _DetailsEjerciciosState createState() => _DetailsEjerciciosState();
}

class _DetailsEjerciciosState extends State<DetailsEjercicios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.ejercicio.name),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                //TODO: Página de Registro de uso
                // Navigator.pushNamed(context, '/registroUso');
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/misc/dummy-square.png',
                  width: 300,
                  height: 300,
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Musculo principal: "),
                          Chip(label: Text("Abdomen"))
                        ],
                      ),
                      Row(
                        children: [Text("Musculos secundarios: "), Text("n/a")],
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          children: [
                            Text("Materiales: "),
                            // Chip(label: Text("Pelota ejercicio"))
                            Flexible(
                              fit: FlexFit.tight,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: widget.ejercicio.equipment.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _getEquipment(index, widget.ejercicio);
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Used this dependency (flutter_html) since the description is stored within html tags
                      Html(data: widget.ejercicio.description),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _getEquipment(int indexEquipment, Exercise ejercicio) {
  var equipmentName = '';
  //using the equipment list in enumerations.dart
  for (var map in equipmentList) {
    if (map.containsKey('id')) {
      if (map['id'] == ejercicio.equipment[indexEquipment]) {
        // print(map['name']);
        equipmentName = map['name'];
      }
    }
  }
  return Chip(
    label: Text(equipmentName),
  );
}
