import 'package:flutter/material.dart';
import 'package:proyecto_integrador/exercises/item_exercise.dart';
import 'package:proyecto_integrador/models/exercise.dart';

class ListExercisesWorkout extends StatefulWidget {
  final List<Exercise> exercisesWorkout;
  final String workoutName;

  ListExercisesWorkout({
    Key key,
    @required this.exercisesWorkout,
    @required this.workoutName,
  }) : super(key: key);

  @override
  _ListExercisesWorkoutState createState() => _ListExercisesWorkoutState();
}

class _ListExercisesWorkoutState extends State<ListExercisesWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.workoutName}'),
        centerTitle: true,
      ),
      body: Container(
        child: Scrollbar(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.exercisesWorkout.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemExercise(ejercicio: widget.exercisesWorkout[index]);
              }),
        ),
      ),
    );
  }
}
