class Exercise {
  String name;
  String type;
  String muscle;
  String equipment;
  String difficulty;
  String instructions;

  Exercise(
      {this.name,
      this.type,
      this.muscle,
      this.equipment,
      this.difficulty,
      this.instructions});

  factory Exercise.fromJson(dynamic json) {
    return Exercise(
        name: json['name'] as String,
        type: json['type'] as String,
        muscle: json['muscle'] as String,
        equipment: json['equipment'] as String,
        difficulty: json['difficulty'] as String,
        instructions: json['instructions'] as String);
  }

  static List<Exercise> exercisesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Exercise.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Exercise {name: $name, type: $type, muscle: $muscle, equipment: $equipment, difficulty: $difficulty, instructions: $instructions }';
  }
}
