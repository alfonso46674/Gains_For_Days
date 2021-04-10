import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/repositories/enumerations.dart';
import 'package:proyecto_integrador/repositories/exerciseApiClient.dart';
import 'package:proyecto_integrador/repositories/exercise_repository.dart';
import 'bloc/exercises_bloc.dart';
import 'item_exercise.dart';
import 'package:http/http.dart' as http;

class ListExercises extends StatefulWidget {
  final ExerciseCategory category;
  final String title;
  const ListExercises({
    this.category,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  _ListExercisesState createState() => _ListExercisesState();
}

class _ListExercisesState extends State<ListExercises> {
  EjerciciosBloc _ejerciciosBloc;
  ExerciseRepository repositorio = ExerciseRepository(
    exerciseApiClient: ExerciseApiClient(
      httpClient: http.Client(),
    ),
  );

  @override
  void dispose() {
    _ejerciciosBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/searchExercise');
              },
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) {
            _ejerciciosBloc =
                EjerciciosBloc(repositorioEjercicios: repositorio);
            return _ejerciciosBloc;
          },
          child: contenedorEjercicios(),
        ));
  }

  Widget contenedorEjercicios() {
    return Container(child: BlocBuilder<EjerciciosBloc, EjerciciosState>(
      builder: (context, state) {
        //si no hay ejercicios desplegados
        if (state is EjerciciosVaciosState) {
          //hacer el fetch de los ejercicios, lo cual detonara un evento
          BlocProvider.of<EjerciciosBloc>(context)
              .add(FetchEjerciciosEvent(widget.category));
        }
        // si da error al hacer fetch de ejercicios
        if (state is EjerciciosErrorState) {
          return Center(
            child: Text('Failed to fetch exercises, try again later'),
          );
        }
        //Ejercicios cargados exitosamente
        if (state is EjerciciosCargadosState) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.exercisesList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemExercise(
                ejercicio: state.exercisesList[index],
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
