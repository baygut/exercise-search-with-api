import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mvvmtemplate/models/exercise.api.dart';
import 'package:mvvmtemplate/models/exercise.dart';
import 'package:mvvmtemplate/views/components/exerciseCard.dart';
import 'package:popover/popover.dart';

class ExerciseSearch extends StatefulWidget {
  @override
  _ExerciseSearchState createState() => _ExerciseSearchState();
}

bool muscle = false;

class _ExerciseSearchState extends State<ExerciseSearch> {
  List<Exercise> _exercises;
  List<Exercise> display;
  bool _isLoading = true;
  var input = TextEditingController();

  @override
  void initState() {
    super.initState();
    getExercises();
  }

  Future<void> getExercises() async {
    _exercises = await ExerciseApi.getExercise();
    display = List.from(_exercises);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 96, 96, 96),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextField(
            onChanged: (value) => searchExercise(value),
            onSubmitted: (value) {
              print(value);
            },
            controller: input,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.settings_applications),
                  onPressed: (() async {
                    display = null;
                    display = await ExerciseApi.filterExercise(
                        "muscle", "hamstrings");
                    setState(() {});
                  }),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 163, 159, 157),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide.none),
                hintText: "What do you want to do today champ!",
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: display.length,
                itemBuilder: (context, index) {
                  return ExerciseCard(
                      name: display[index].name,
                      type: display[index].type,
                      muscle: display[index].muscle,
                      instructions: display[index].instructions);
                },
              ));
  }

  Future<void> searchExercise(String query) async {
    display = await ExerciseApi.searchExercise(query);
    setState(() {});
  }
}
