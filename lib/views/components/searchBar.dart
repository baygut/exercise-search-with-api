import 'package:flutter/material.dart';

Widget searchBar(TextEditingController input, Function function) {
  return TextField(
    onChanged: (value) => function,
    controller: input,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.deepOrange,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide.none),
        hintText: "What do you want to do today champ!",
        prefixIcon: Icon(Icons.search)),
  );
}
