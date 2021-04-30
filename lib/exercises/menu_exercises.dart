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
        title: Text("Exercises"),
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
              BlocProvider.of<AuthBloc>(context).add(
                  SignOutAuthenticationEvent());      
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
                title: Text("Abdominals"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.ABS,
                    title: 'Abdominals',
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
                title: Text("Chest"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.CHEST,
                    title: 'Chest',
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
                title: Text("Arms"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.ARMS,
                    title: 'Arms',
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
                title: Text("Back"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.BACK,
                    title: 'Back',
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
                title: Text("Legs"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.LEGS,
                    title: 'Legs',
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
                title: Text("Calves"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.CALVES,
                    title: 'Calves',
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
                title: Text("Shoulders"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.SHOULDERS,
                    title: 'Shoulders',
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
                title: Text("Complete exercise list"),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListExercises(
                    category: ExerciseCategory.EVERYTHING,
                    title: 'Complete exercise list',
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
