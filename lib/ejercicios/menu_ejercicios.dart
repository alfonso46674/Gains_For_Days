import 'package:flutter/material.dart';
import 'item_ejercicios.dart';

class MenuEjercicios extends StatelessWidget {
  const MenuEjercicios({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicios"),
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
          child: Column(
        children: [
          //Abdomen
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/dummy-square.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Abdomen"),
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/listaEjercicios');
            },
          ),
          //Pecho
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/dummy-square.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Pecho"),
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/listaEjercicios');
            },
          ),
          //Brazos
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/dummy-square.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Brazos"),
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/listaEjercicios');
            },
          ),
          //Espalda
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/dummy-square.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Espalda"),
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/listaEjercicios');
            },
          ),
          //Piernas
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/dummy-square.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Piernas"),
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/listaEjercicios');
            },
          ),
          //Pantorrillas
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/dummy-square.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Pantorrillas"),
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/listaEjercicios');
            },
          ),
          //Hombros
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/dummy-square.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Hombros"),
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/listaEjercicios');
            },
          ),
          //Todos los ejercicios
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/dummy-square.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Todos los ejercicios"),
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/listaEjercicios');
            },
          ),
          
        ],
      )),
      //TODO: Usar tabBars para manejar cambiar de pestañas
      //TODO: Crear un widget para esto para que sea mas facil portarlo a otros archivos
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.fitness_center),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.view_list),
              onPressed: () {
                Navigator.pushNamed(context, '/misRutinas');
              },
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
