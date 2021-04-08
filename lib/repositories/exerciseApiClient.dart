import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_integrador/models/exercise.dart';

class ExerciseApiClient {
  final _baseUrl = 'https://wger.de/api/v2';
  final http.Client httpClient;

  Box _appDataBox = Hive.box('AppData');

  ExerciseApiClient({@required this.httpClient}) : assert(httpClient != null);

  //Return all of the exercises in english and with a limit of 200 exercises
  Future<void> fetchExercises() async {
    final urlExercises = '$_baseUrl/exercise?language=2&limit=500';
    //make a petition to the exercises endpoint and store the exercises json
    final responseExercises = await this.httpClient.get(Uri.parse(urlExercises));
    final List<dynamic> exerciseList = [];

    //make a petition to the exercise images endpoint and store the images json
    final urlImages = '$_baseUrl/exerciseimage/?is_main=True&limit=500';
    final responseImages = await this.httpClient.get(Uri.parse(urlImages));

    print('_appDataBox.length: ${_appDataBox.length}');
    await _appDataBox.clear();

    if (responseExercises.statusCode != 200) {
      throw new Exception('Error getting exercises');
    }
    //if there is no data in the box, fill it
    else if (_appDataBox.length == 0) {
      //Save the exercises from the response into an array using the json format function from the Exercise model
      final exercisesJson = jsonDecode(responseExercises.body);
      //save the images from the responseImages; Decode the json and transform it into a usable object
      final imagesJson = jsonDecode(responseImages.body);

      //print(json[keys])
      for (int i = 0; i < exercisesJson['results'].length; i++) {
        //filter out exercises with empty lists for main muscles or equipment
        if (_areParametersEmpty(i, exercisesJson)) {

          //obtain the image for the exercise given its id
          var imageUrl = _findExerciseImage(exercisesJson['results'][i]['id'], imagesJson);
          //Parse the exercise into an Exercise object and save it in the list
          exerciseList.add(Exercise.fromJson(exercisesJson['results'][i], imageUrl));
        }
      }

      // await _appDataBox.clear();

      // Save the exercise list in hive
      await _appDataBox.put('exercises', exerciseList);
    }
  }
}

//filter out exercises if the main muscle or equipment list are empty
bool _areParametersEmpty(int index, var json ){
         bool mainMusclesEmpty = json['results'][index]['muscles'].length == 0;
        bool equipmentEmpty = json['results'][index]['equipment'].length == 0;

        if(mainMusclesEmpty  || equipmentEmpty) return false;
        else return true;
}

//Given an exerciseId, it searches in imagesJson if there exists an object where its property 'image' contains the exerciseId
//If so, it then returns the image url, otherwise returns null
String _findExerciseImage(int exerciseId, var imagesJson){
  for(var i = 0; i < imagesJson['results'].length; i++){
    if(imagesJson['results'][i]['image'].contains(exerciseId.toString())){
      return imagesJson['results'][i]['image'];
    }
  }
  return null;
}