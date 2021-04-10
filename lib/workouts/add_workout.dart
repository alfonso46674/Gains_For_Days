import 'package:flutter/material.dart';
import 'package:proyecto_integrador/utils/constants.dart'; 


class AddWorkout extends StatefulWidget {
  AddWorkout({Key key}) : super(key: key);

  @override
  _AddWorkoutState createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New workout"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Bara de busqueda
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  labelText: 'Search'),
            ),
          ),
          //Texto de materiales
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 2,
              // right: 10,
              bottom: 2,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Equipment",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //Seleccion de materiales
          Padding(
            padding: const EdgeInsets.only(
                left: 30,
                // top:2,
                right: 30,
                bottom: 2),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputChip(
                      // avatar: CircleAvatar(
                      //   backgroundColor: Colors.grey.shade800,
                      //   child: Text('AB'),
                      // ),
                      label: Text('Pelota ejercicio'),
                      onPressed: () {},
                    ),
                    InputChip(
                      label: Text('Barra'),
                      onPressed: () {},
                    ),
                    InputChip(
                      label: Text('Mancuernas'),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //TODO: Usar FilterChips en lugar de InputChips
                    InputChip(
                      // avatar: CircleAvatar(
                      //   backgroundColor: Colors.grey.shade800,
                      //   child: Text('AB'),
                      // ),
                      label: Text('Máquina'),
                      onPressed: () {},
                    ),
                    InputChip(
                      label: Text('Ligas'),
                      onPressed: () {},
                    ),
                    InputChip(
                      label: Text('Peso libre'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Texto de los musculos
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 2,
              // right: 10,
              bottom: 2,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Muscles",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //Seleccion musculos
          Padding(
            padding: const EdgeInsets.only(
                left: 30,
                // top:2,
                right: 30,
                bottom: 2),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputChip(
                      // avatar: CircleAvatar(
                      //   backgroundColor: Colors.grey.shade800,
                      //   child: Text('AB'),
                      // ),
                      label: Text('Abdomen'),
                      onPressed: () {},
                    ),
                    InputChip(
                      label: Text('Pecho'),
                      onPressed: () {},
                    ),
                    InputChip(
                      label: Text('Espalda'),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputChip(
                      // avatar: CircleAvatar(
                      //   backgroundColor: Colors.grey.shade800,
                      //   child: Text('AB'),
                      // ),
                      label: Text('Hombro'),
                      onPressed: () {},
                    ),
                    InputChip(
                      label: Text('Brazo'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Mostrar resultados
          //TODO: Implementar que se muestren resultados de acuerdo a la seleccion de busqueda
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text("Abdomen Ejercicio 1"),
            ),
          ),


          //Ingresar nombre de rutina
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  labelText: 'Name of workout'),
            ),
          ),

          //Boton para crear rutina
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
                  'ADD',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
