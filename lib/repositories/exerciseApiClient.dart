
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_integrador/models/exercise.dart';

class ExerciseApiClient {
  final _baseUrl = 'https://wger.de/api/v2';
  final http.Client httpClient;

  ExerciseApiClient({
    @required this.httpClient
  }) : assert(httpClient != null);

  //Return all of the exercises in english
  Future<List<dynamic>> fetchExercises() async {
    final url = '$_baseUrl/exercise?language=2';
    final response = await this.httpClient.get(Uri.parse(url));
    final List<dynamic> exerciseList = [];

    
    if(response.statusCode != 200){
      throw new Exception('Error getting exercises');
    }

    final json = jsonDecode(response.body);
    //print(json[keys])
    for(int i = 0; i < json['results'].length; i++){
       exerciseList.add(Exercise.fromJson(json['results'][i]));
    }

    return exerciseList;

  }
}