import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String text) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Instructions:"),
    content: Text(text),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class ExerciseCard extends StatelessWidget {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;

  ExerciseCard({
    @required this.name,
    @required this.type,
    @required this.muscle,
    @required this.equipment,
    @required this.difficulty,
    @required this.instructions,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 7),
                          Text(
                            name,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 7),
                        ],
                      ),
                    ),
                  ],
                ),
                alignment: Alignment.topLeft),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text(muscle),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text(type),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        print("tapped on exercise");
        showAlertDialog(context, instructions.toString());
      },
    );
  }
}
