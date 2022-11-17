import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvmtemplate/models/exercise.dart';

class ExerciseApi {
  static Future<List<Exercise>> getExercise() async {
    var uri = Uri.https(
      'exercises-by-api-ninjas.p.rapidapi.com',
      '/v1/exercises',
    );

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "d8cf166769msh17b9ac8c8e27970p174cb9jsn69477c8f248e",
      "X-RapidAPI-Host": "exercises-by-api-ninjas.p.rapidapi.com",
      "useQueryString": "true",
    });

    var data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data) {
      _temp.add(i);
    }
    return Exercise.exercisesFromSnapshot(_temp);
  }

  static Future<List<Exercise>> searchExercise(String key) async {
    var uri = Uri.https('exercises-by-api-ninjas.p.rapidapi.com',
        '/v1/exercises', {"name": key});

    final search_response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "d8cf166769msh17b9ac8c8e27970p174cb9jsn69477c8f248e",
      "X-RapidAPI-Host": "exercises-by-api-ninjas.p.rapidapi.com",
      "useQueryString": "true",
    });

    var data = jsonDecode(search_response.body);
    List _temp = [];
    for (var i in data) {
      _temp.add(i);
    }
    return Exercise.exercisesFromSnapshot(_temp);
  }

  static Future<List<Exercise>> filterExercise(
      String filterBy, String key) async {
    var uri = Uri.https('exercises-by-api-ninjas.p.rapidapi.com',
        '/v1/exercises', {filterBy: key});

    final filter_response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "d8cf166769msh17b9ac8c8e27970p174cb9jsn69477c8f248e",
      "X-RapidAPI-Host": "exercises-by-api-ninjas.p.rapidapi.com",
      "useQueryString": "true",
    });

    var data = jsonDecode(filter_response.body);
    List _temp = [];
    for (var i in data) {
      _temp.add(i);
    }
    return Exercise.exercisesFromSnapshot(_temp);
  }
}
