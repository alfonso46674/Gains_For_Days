import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/auth/bloc/auth_bloc.dart';
import 'package:proyecto_integrador/exercises/list_exercises.dart';
import 'package:proyecto_integrador/repositories/enumerations.dart';
import 'package:proyecto_integrador/restartWidget.dart';
import 'item_exercise.dart';

class MenuExercises extends StatelessWidget {
  const MenuExercises({Key key}) : super(key: key);

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
              Navigator.pushNamed(context, '/searchExercise');
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
                  'assets/categories/abs.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Abdomen"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.ABS,
                    title: 'Abdomen',
                  ),
                ),
              );
            },
          ),
          //Pecho
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/categories/pecs.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Pecho"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.CHEST,
                    title: 'Pecho',
                  ),
                ),
              );
            },
          ),
          //Brazos
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/categories/arms.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Brazos"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.ARMS,
                    title: 'Brazos',
                  ),
                ),
              );
            },
          ),
          //Espalda
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/categories/back.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Espalda"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.BACK,
                    title: 'Espalda',
                  ),
                ),
              );
            },
          ),
          //Piernas
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/categories/legs.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Piernas"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.LEGS,
                    title: 'Piernas',
                  ),
                ),
              );
            },
          ),
          //Pantorrillas
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/categories/calves.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Pantorrillas"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.CALVES,
                    title: 'Pantorrillas',
                  ),
                ),
              );
            },
          ),
          //Hombros
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/categories/shoulders.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Hombros"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.SHOULDERS,
                    title: 'Hombros',
                  ),
                ),
              );
            },
          ),
          //Todos los ejercicios
          TextButton(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/categories/allbody.png',
                  width: 64,
                  height: 64,
                ),
                title: Text("Todos los ejercicios"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.EVERYTHING,
                    title: 'Todos los ejercicios',
                  ),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
