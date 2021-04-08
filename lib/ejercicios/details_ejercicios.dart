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
                print(widget.ejercicio);
                // Navigator.pushNamed(context, '/registroUso');
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             //if the exercice's imageUrl is not null, display said image, otherwise display stock photo
            Builder(
              builder: (context) {
                final condition = widget.ejercicio.imageUrl != null;
                return condition
                    ? Container(
                        alignment: Alignment.center,
                        child: Image.network(
                          widget.ejercicio.imageUrl,
                          width: 300,
                          height: 300,
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/misc/dummy-square.png',
                          width: 300,
                          height: 300,
                        ),
                      );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        child: Row(
                          children: [
                            Text("Musculo principal: "),
                            Flexible(
                              fit: FlexFit.tight,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:
                                      widget.ejercicio.mainMuscles.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _getMainMuscles(
                                        index, widget.ejercicio);
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          children: [
                            Text("Musculos secundarios: "),
                            //Show none when the secondary muscle list is empty, otherwise show all the secondary muscles with a listview
                            Builder(
                              builder: (context) {
                                final condition =
                                    widget.ejercicio.secondaryMuscles.length ==
                                        0;

                                return condition
                                    ? Chip(
                                        label: Text('None'),
                                      )
                                    : Flexible(
                                        fit: FlexFit.tight,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: widget.ejercicio
                                              .secondaryMuscles.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return _getSecondaryMuscles(
                                                index, widget.ejercicio);
                                          },
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          children: [
                            Text("Materiales: "),
                            Flexible(
                              fit: FlexFit.tight,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: widget.ejercicio.equipment.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _getEquipment(
                                        index, widget.ejercicio);
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
              padding: const EdgeInsets.all(8),
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

Widget _getSecondaryMuscles(int indexMuscles, Exercise ejercicio) {
  var secondaryMuscleName = '';
  //using the muscle list in enumerations.dart
  for (var map in musclesList) {
    if (map.containsKey('id')) {
      if (map['id'] == ejercicio.secondaryMuscles[indexMuscles]) {
        // print(map['name']);
        secondaryMuscleName = map['name'];
      }
    }
  }
  return Chip(
    label: Text(secondaryMuscleName),
  );
}

Widget _getMainMuscles(int indexMuscles, Exercise ejercicio) {
  var mainMuscleName = '';
  //using the muscle list in enumerations.dart
  for (var map in musclesList) {
    if (map.containsKey('id')) {
      if (map['id'] == ejercicio.mainMuscles[indexMuscles]) {
        // print(map['name']);
        mainMuscleName = map['name'];
      }
    }
  }
  return Chip(
    label: Text(mainMuscleName),
  );
}
