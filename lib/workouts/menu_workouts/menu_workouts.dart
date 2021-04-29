import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/utils/constants.dart';
import 'package:proyecto_integrador/workouts/menu_workouts/bloc/menuworkout_bloc.dart';

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
      ),
      body: BlocProvider(
        create: (context) =>
            MenuWorkoutBloc()..add(MenuWorkoutRequestWorkouts()),
        child: BlocConsumer<MenuWorkoutBloc, MenuworkoutState>(
          listener: (context, state) {
            // TODO: implement listener
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
                                      title: Text("${state.workoutName[index]}"),
                                    )),
                                    onPressed: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) => DetailsExercise(
                                      //             ejercicio: widget.ejercicio,
                                      //           )),
                                      // );
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
                        Navigator.of(context).pushNamed('/addWorkout');
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
