import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'exercise.g.dart';
// flutter pub run build_runner build
@HiveType(typeId: 1, adapterName: 'ExerciseAdapter')
class Exercise extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int category;
  @HiveField(3)
  final List<dynamic> equipment;
  @HiveField(4)
  final String description; 
  @HiveField(5)
  final List<dynamic> mainMuscles;
  @HiveField(6)
  final List<dynamic> secondaryMuscles;
  @HiveField(7)
  final String imageUrl;
  //usada para saber si se mandara al workout o no
  @HiveField(8)
  bool selectedForWorkout = false;
  

  Exercise({
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.equipment,
    @required this.description,
    @required this.mainMuscles,
    @required this.secondaryMuscles,
    @required this.imageUrl,
    this.selectedForWorkout,
  });

  @override
  List<Object> get props => [id, name, category, equipment, description, mainMuscles, secondaryMuscles, imageUrl,selectedForWorkout];

  //receives a json and returns an exercise object
   static Exercise fromJson(dynamic json, String imageUrl){
    return Exercise(
      id: json["id"],
      name : json["name"],
      category: json["category"],
      equipment: json["equipment"],
      description: json["description"],
      mainMuscles: json["muscles"],
      secondaryMuscles: json["muscles_secondary"],
      imageUrl: imageUrl,
      selectedForWorkout: false
    );

    // @override
    // String toString() {
    //   return 'Exercise {$name} with id {$id}';
    // }
  }

   Map<String,dynamic> exerciseToJson(){
    return {
      'id':id,
      'name':name,
      'category':category,
      'equipment':equipment,
      'description':description,
      'mainMuscles':mainMuscles,
      'secondaryMuscles':secondaryMuscles,
      'imageUrl':imageUrl
    };
  }

}