import 'package:flutter/material.dart';

class DetailsEjercicios extends StatefulWidget {
  DetailsEjercicios({Key key}) : super(key: key);

  @override
  _DetailsEjerciciosState createState() => _DetailsEjerciciosState();
}

class _DetailsEjerciciosState extends State<DetailsEjercicios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ejercicios de abdomen 1"),
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
                  'assets/dummy-square.png',
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
                      Row(
                        children: [
                          Text("Materiales: "),
                          Chip(label: Text("Pelota ejercicio"))
                        ],
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
                        "Paso 1",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("El primer paso es...")
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
                        "Paso 2",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("El segundo paso es...")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
