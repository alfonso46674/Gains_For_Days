import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyecto_integrador/models/exercise.dart';

part 'menuworkout_event.dart';
part 'menuworkout_state.dart';

class MenuWorkoutBloc extends Bloc<MenuworkoutEvent, MenuworkoutState> {
  final _cFirestore = FirebaseFirestore.instance;

  MenuWorkoutBloc() : super(MenuworkoutInitial());

  @override
  Stream<MenuworkoutState> mapEventToState(
    MenuworkoutEvent event,
  ) async* {
    if (event is MenuWorkoutRequestWorkouts) {
      yield MenuWorkoutLoadingState();
      try {
        var docFirebase = await _cFirestore.collection('workouts').get();
        var docSnapshots = docFirebase.docs;

        yield MenuWorkoutLoadedWorkoutState(
          workoutExercises: _getWorkoutExercises(docSnapshots),
          workoutNames: _getWorkoutNames(docSnapshots),
        );
      } catch (e) {
        yield MenuWorkoutErrorState(errorMsg: e);
      }
    }
  }

  List<List<Exercise>> _getWorkoutExercises(List<QueryDocumentSnapshot> data) {
    List<List<Exercise>> listOfWorkout = []; //new List<List<Exercise>>()
    List<Exercise> exercisesWorkout = [];

    data.forEach((workout) {
      exercisesWorkout = [];
      for (var j = 0; j < workout['exerciseCount']; j++) {
        exercisesWorkout.add(Exercise(
            id: workout['exercise_$j']['id'],
            name: workout['exercise_$j']['name'],
            category: workout['exercise_$j']['category'],
            equipment: workout['exercise_$j']['equipment'],
            description: workout['exercise_$j']['description'],
            mainMuscles: workout['exercise_$j']['mainMuscles'],
            secondaryMuscles: workout['exercise_$j']['secondaryMuscles'],
            imageUrl: workout['exercise_$j']['imageUrl']));
      }
      listOfWorkout.add(exercisesWorkout);
    });
    // print('exercisesWorkout.length ${exercisesWorkout.length}');
    // print('listOfWorkout.length ${listOfWorkout.length}');
    return listOfWorkout;
  }

  List<String> _getWorkoutNames(List<QueryDocumentSnapshot> data) {
    List<String> workoutNames = [];
    data.forEach((workout) {
      workoutNames.add(workout['workoutName']);
    });
    return workoutNames;
  }
}

// cada elemento agregarlo a una lista.
// Future<List<NewFirebase>> _getNoticias() async {
//   try {
//     var noticias = await _cFirestore.collection("noticias").get();
//     return noticias.docs
//         .map(
//           (element) => NewFirebase(
//             author: element["author"],
//             title: element["title"],
//             urlToImage: element["urlToImage"],
//             description: element["description"],
//             // source: element["source"],
//             //publishedAt: DateTime.parse(element["publishedAt"]),
//           ),
//         )
//         .toList();
//   } catch (e) {
//     print("Error: $e");
//     return [];
//   }
// }
