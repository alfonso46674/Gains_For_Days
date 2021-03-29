import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/auth/bloc/auth_bloc.dart';
import 'package:proyecto_integrador/restartWidget.dart';
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
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Future.delayed(Duration(seconds: 1), () {
                BlocProvider.of<AuthBloc>(context).add(
                  SignOutAuthenticationEvent(),
                );
              });
              Future.delayed(Duration(seconds: 1), () {
              RestartWidget.restartApp(context);
              });
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
            onPressed: () {
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
            onPressed: () {
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
            onPressed: () {
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
            onPressed: () {
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
            onPressed: () {
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
            onPressed: () {
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
            onPressed: () {
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
            onPressed: () {
              Navigator.pushNamed(context, '/listaEjercicios');
            },
          ),
        ],
      )),
    );
  }
}
