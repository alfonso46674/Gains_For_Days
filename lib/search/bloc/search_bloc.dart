import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:proyecto_integrador/models/exercise.dart';
import 'package:proyecto_integrador/repositories/enumerations.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  Box _appDataBox = Hive.box('AppData');

  SearchBloc() : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchRequestEvent) {
      yield SearchLoadingState();
      try {
        var ejercicios = _appDataBox.get('exercises', defaultValue: []);

        var ejerciciosFiltrados = [];

        // ya que se le pasa al bloc una lista con los nombres del equipment, es necesario mapearlosa a una lista de int con solamente su ids
        // Se hace lo mismo para el equipment y el targetGroup, ya que las propiedades de equipment y musculos  son ints, no strings
        List<int> equipmentIds = _mapEquipmentfromStringToInt(event.equipment);
        List<int> targetGroupsIds =
            _mapTargetGroupsFromStringToInt(event.targetGroups);
    
        // si solo se pidio targetGroups
        if (event.equipment.length == 0 && event.targetGroups.length > 0) {
          for(var i = 0; i < ejercicios.length; i++){
            for(var j = 0; j < targetGroupsIds.length; j++){
              if(targetGroupsIds.contains(ejercicios[i].category)){
                ejerciciosFiltrados.add(ejercicios[i]);
                break;
              }
            }
          }

        }
        //si solo se pidio equipment
        else if (event.targetGroups.length == 0 && event.equipment.length > 0) {
          for(var i = 0; i < ejercicios.length; i++){
            for(var j = 0; j < equipmentIds.length; j++){
              if(ejercicios[i].equipment.contains(equipmentIds[j])){
                ejerciciosFiltrados.add(ejercicios[i]);
                break;
              }
            }
          }

        } 
        if(event.equipment.length > 0 && event.targetGroups.length > 0) {
        //si se esta pidiendo equipment y target groups,
          //iterar los ejercicios para poder filtrar
          for (var i = 0; i < ejercicios.length; i++) {
            //filtrar los ejercicios por medio de la lista de equipment y targetgroup
            for (var j = 0; j < targetGroupsIds.length; j++) {
              //filtrar por targetGroups, si existen ejercicios con ese targetGroup, filtrar por equipment
              if (targetGroupsIds.contains(ejercicios[i].category)) {
                //filtrar por equipment
                for (var k = 0; k < equipmentIds.length; k++) {
                  if (ejercicios[i].equipment.contains(equipmentIds[k])) {
                    ejerciciosFiltrados.add(ejercicios[i]);
                    break;
                  }
                }
                break;
              }
            }
          }
        }

        //si no se mando nada
        else if(event.equipment.length == 0 && event.targetGroups.length == 0){
          yield SearchEmptyRequestState();
        }

        // print(ejerciciosFiltrados.length);
        yield SearchResultState(searchResult: ejerciciosFiltrados);

      } catch (e) {
        yield SearchErrorMessageState(errorMsg: e);
      }
    }
  }
}

List<int> _mapEquipmentfromStringToInt(List<String> equipment) {
  List<int> mappedEquipment = [];
  for (var i = 0; i < equipment.length; i++) {
    //using the equipment list in enumerations.dart
    for (var object in equipmentList) {
      // if(object.containsKey('id')){
      if (object['name'] == equipment[i]) {
        mappedEquipment.add(object['id']);
      }
      // }
    }
  }

  return mappedEquipment;
}

List<int> _mapTargetGroupsFromStringToInt(List<String> targetGroups) {
  List<int> mappedTargetGroups = [];

  for (var i = 0; i < targetGroups.length; i++) {
    switch (targetGroups[i]) {
      case 'Abdominals':
        mappedTargetGroups
            .add(ExerciseCategoryExt.categoryMap[ExerciseCategory.ABS]);
        break;
      case 'Chest':
        mappedTargetGroups
            .add(ExerciseCategoryExt.categoryMap[ExerciseCategory.CHEST]);
        break;
      case 'Arms':
        mappedTargetGroups
            .add(ExerciseCategoryExt.categoryMap[ExerciseCategory.ARMS]);
        break;
      case 'Back':
        mappedTargetGroups
            .add(ExerciseCategoryExt.categoryMap[ExerciseCategory.BACK]);
        break;
      case 'Legs':
        mappedTargetGroups
            .add(ExerciseCategoryExt.categoryMap[ExerciseCategory.LEGS]);
        break;
      case 'Calves':
        mappedTargetGroups
            .add(ExerciseCategoryExt.categoryMap[ExerciseCategory.CALVES]);
        break;
      case 'Shoulders':
        mappedTargetGroups
            .add(ExerciseCategoryExt.categoryMap[ExerciseCategory.SHOULDERS]);
        break;
      default:
    }
  }
  return mappedTargetGroups;
}
