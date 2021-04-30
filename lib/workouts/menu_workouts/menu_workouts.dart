import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/utils/constants.dart';
import 'package:proyecto_integrador/workouts/add_workout/add_workout.dart';
import 'package:proyecto_integrador/workouts/add_workout/bloc/addworkout_bloc.dart';
import 'package:proyecto_integrador/workouts/menu_workouts/bloc/menuworkout_bloc.dart';
import 'package:proyecto_integrador/workouts/show_exercises_workout/list_exercises_workout.dart';

class MenuWorkouts extends StatefulWidget {
  MenuWorkouts({Key key}) : super(key: key);

  @override
  _MenuWorkoutsState createState() => _MenuWorkoutsState();
}

class _MenuWorkoutsState extends State<MenuWorkouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My workouts"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: () {
              BlocProvider.of<MenuWorkoutBloc>(context)
                  .add(MenuWorkoutRequestWorkouts());
            },
          ),
        ],
      ),
      body: BlocListener<AddworkoutBloc, AddworkoutState>(
        listener: (context, state) {
          //refrescar los workouts en cuanto se suba uno nuevo
          if (state is AddworkoutSuccessSaveWorkoutState) {
            BlocProvider.of<MenuWorkoutBloc>(context)
                .add(MenuWorkoutRequestWorkouts());
          }
        },
        child: BlocConsumer<MenuWorkoutBloc, MenuworkoutState>(
          listener: (context, state) {
            //al borrar un workout
            if (state is MenuWorkoutSuccessfulWorkoutDeletion) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Workout deleted successfully'),
                  ),
                );
              //llamar a los workouts otra vez
              BlocProvider.of<MenuWorkoutBloc>(context)
                  .add(MenuWorkoutRequestWorkouts());
            }
            //si hay algun error cualquiera
            else if (state is MenuWorkoutErrorState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('${state.errorMsg}'),
                  ),
                );
              //llamar a los workouts otra vez
              BlocProvider.of<MenuWorkoutBloc>(context)
                  .add(MenuWorkoutRequestWorkouts());
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                BlocBuilder<MenuWorkoutBloc, MenuworkoutState>(
                  builder: (context, state) {
                    if (state is MenuWorkoutLoadedWorkoutState) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          BlocProvider.of<MenuWorkoutBloc>(context)
                              .add(MenuWorkoutRequestWorkouts());
                        },
                        child: Scrollbar(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state.workoutExercises.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: TextButton(
                                    child: Card(
                                      child: ListTile(
                                        leading: FlutterLogo(),
                                        title: Text(
                                            "${state.workoutNames[index]}"),
                                        trailing: IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              //delete workout
                                              BlocProvider.of<MenuWorkoutBloc>(
                                                      context)
                                                  .add(
                                                      MenuWorkoutDeleteWorkoutEvent(
                                                workoutName:
                                                    state.workoutNames[index],
                                              ));
                                            }),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListExercisesWorkout(
                                                  exercisesWorkout: state
                                                      .workoutExercises[index],
                                                  workoutName:
                                                      state.workoutNames[index],
                                                )),
                                      );
                                    },
                                  ),
                                );
                              }),
                        ),
                      );
                    } else if (state is MenuWorkoutLoadingState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else
                      return Center();
                  },
                ),
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
                        'ADD WORKOUT',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        //https://www.youtube.com/watch?v=laqnY0NjU3M&t=440s
                        //minuto 7:00 para comunicacion de blocs entre rutas
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                    value: BlocProvider.of<AddworkoutBloc>(
                                        context),
                                    child: AddWorkout(),
                                  )),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
