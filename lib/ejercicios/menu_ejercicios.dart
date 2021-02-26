import 'package:flutter/material.dart';
import 'item_menu_ejercicios.dart';

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
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ItemMenuEjercicios();
          },
        ),
      ),
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
