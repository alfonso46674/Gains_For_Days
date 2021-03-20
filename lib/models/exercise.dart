import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Exercise extends Equatable {
  final int id;
  final String name;
  final int category;
  final List<dynamic> equipment;
  final String description; 

  Exercise({
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.equipment,
    @required this.description,
  });

  @override
  List<Object> get props => [id, name, category, equipment, description];

  //receives a json and returns an exercise object
   static Exercise fromJson(dynamic json){
    return Exercise(
      id: json["id"],
      name : json["name"],
      category: json["category"],
      equipment: json["equipment"],
      description: json["description"]
    );

    // @override
    // String toString() {
    //   return 'Exercise {$name} with id {$id}';
    // }
  }

}