import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyecto_integrador/auth/user_auth_provider.dart';
import 'package:proyecto_integrador/models/exercise.dart';

part 'menuworkout_event.dart';
part 'menuworkout_state.dart';

class MenuWorkoutBloc extends Bloc<MenuworkoutEvent, MenuworkoutState> {
  final _cFirestore = FirebaseFirestore.instance;
  UserAuthProvider _authProvider = UserAuthProvider();

  MenuWorkoutBloc() : super(MenuworkoutInitial());

  @override
  Stream<MenuworkoutState> mapEventToState(
    MenuworkoutEvent event,
  ) async* {
    // cuando se piden los workouts a firebase
    if (event is MenuWorkoutRequestWorkouts) {
      yield MenuWorkoutLoadingState();
      try {
        var docFirebase = await _cFirestore.collection('workouts').get();
        var docSnapshots = docFirebase.docs;

        yield MenuWorkoutLoadedWorkoutState(
          workoutExercises:
              _getWorkoutExercises(docSnapshots, await _authProvider.getUser()),
          workoutNames: _getWorkoutNames(docSnapshots,await _authProvider.getUser()),
        );
      } catch (e) {
        yield MenuWorkoutErrorState(errorMsg: e);
      }
    }
    //se quiere eliminar un workout

    else if (event is MenuWorkoutDeleteWorkoutEvent) {
      // print(await _deleteWorkout(event.workoutName));
      if (await _deleteWorkout(event.workoutName)) {
        yield MenuWorkoutSuccessfulWorkoutDeletion();
      } else
        yield MenuWorkoutErrorState(errorMsg: 'Error while deleting workout');
    }
  }

  List<List<Exercise>> _getWorkoutExercises(
      List<QueryDocumentSnapshot> data, String currentUserEmail) {
    List<List<Exercise>> listOfWorkout = []; //new List<List<Exercise>>()
    List<Exercise> exercisesWorkout = [];

    data.forEach((workout) {
      //filter exercises by the current logged in emails user
      if (workout['userEmail'] == currentUserEmail) {
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
      }
    });
    // print('exercisesWorkout.length ${exercisesWorkout.length}');
    // print('listOfWorkout.length ${listOfWorkout.length}');
    return listOfWorkout;
  }

  List<String> _getWorkoutNames(
      List<QueryDocumentSnapshot> data, String currentUserEmail) {
    List<String> workoutNames = [];
    data.forEach((workout) {
      //filter exercises by the current logged in emails user
      if (workout['userEmail'] == currentUserEmail) {
        workoutNames.add(workout['workoutName']);
      }
    });
    return workoutNames;
  }

  Future<bool> _deleteWorkout(String workoutName) async {
    //https://stackoverflow.com/questions/63897130/deleting-document-from-cloud-firestore-in-flutter
    try {
      var data = await _cFirestore
          .collection('workouts')
          .where('workoutName', isEqualTo: workoutName)
          .get();
      var workoutToDelete = data.docs;

      //the workout exists
      if (workoutToDelete.isNotEmpty && workoutToDelete.length > 0) {
        workoutToDelete.forEach((element) async {
          await _cFirestore.collection('workouts').doc(element.id).delete();
        });
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }
}
