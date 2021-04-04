import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:proyecto_integrador/repositories/exerciseApiClient.dart';

class ExerciseRepository {
  final ExerciseApiClient exerciseApiClient;

  ExerciseRepository({@required this.exerciseApiClient})
    : assert(exerciseApiClient != null);

  Future<void> fetchExercises() async {
     await exerciseApiClient.fetchExercises();
  }
}