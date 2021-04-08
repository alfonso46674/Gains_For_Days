import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:proyecto_integrador/repositories/enumerations.dart';
import 'package:proyecto_integrador/repositories/exercise_repository.dart';

part 'ejercicios_event.dart';
part 'ejercicios_state.dart';

class EjerciciosBloc extends Bloc<EjerciciosEvent, EjerciciosState> {
  Box _appDataBox = Hive.box('AppData');

  final ExerciseRepository repositorioEjercicios;

  EjerciciosBloc({@required this.repositorioEjercicios})
      : super(
            EjerciciosVaciosState()); //: assert(repositorioEjercicios != null);

  // @override
  // EjerciciosBloc get initialState => EjerciciosVacios();

  // EjerciciosBloc() : super(EjerciciosVacios());

  @override
  Stream<EjerciciosState> mapEventToState(
    EjerciciosEvent event,
  ) async* {
    // si se intenta descargar los ejercicios
    if (event is FetchEjerciciosEvent) {
      //mandar el estado de que se estan cargando
      yield EjerciciosCargandoState();
      //busca los ejercicios solicitados en el hive box
      try {
        var ejercicios = _appDataBox.get('exercises', defaultValue: []);

        // Si no se estan pidiendo todos los ejercicios -siendo que todos los ejercicios es el indice 15 -, renderizar por medio del event.category
        if (ExerciseCategoryExt.categoryMap[event.category] != 15) {

          //filtrar los ejercicios por medio del tipo de categoria al que pertenecen y regresarlos
          yield EjerciciosCargadosState(
            exercisesList: ejercicios.where((exercise) =>
                exercise.category ==
                ExerciseCategoryExt.categoryMap[event.category]).toList(),
          );
        } else {
          yield EjerciciosCargadosState(exercisesList: ejercicios);
        }
      } catch (e) {
        print('Error: ${e}');
        yield EjerciciosErrorState();
      }
    }
  }
}
