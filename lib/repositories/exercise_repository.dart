import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:proyecto_integrador/models/exercise.dart';
import 'package:proyecto_integrador/repositories/exerciseApiClient.dart';

class ExerciseRepository {
  final ExerciseApiClient exerciseApiClient;

  ExerciseRepository({@required this.exerciseApiClient})
    : assert(exerciseApiClient != null);

  Future<List<dynamic>> fetchExercises() async {
    return await exerciseApiClient.fetchExercises();
  }
}