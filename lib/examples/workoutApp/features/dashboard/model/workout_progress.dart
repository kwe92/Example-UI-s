import 'dart:convert';

// TODO: going to need to be refactored

class WorkoutProgress {
  final String workoutType;
  final List<String> exercises;
  final int minutesRemaining;
  int completed;
  final int total;

  WorkoutProgress({
    required this.workoutType,
    required this.exercises,
    required this.minutesRemaining,
    required this.completed,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'workoutType': workoutType,
      'exercises': exercises,
      'minutesRemaining': minutesRemaining,
      'completed': completed,
      'total': total,
    };
  }

  factory WorkoutProgress.fromMap(Map<String, dynamic> map) {
    return WorkoutProgress(
      workoutType: map['workoutType'] ?? '',
      exercises: List<String>.from(map['exercises']),
      minutesRemaining: map['minutesRemaining']?.toInt() ?? 0,
      completed: map['completed']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutProgress.fromJson(String source) => WorkoutProgress.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WorkoutProgress(workoutType: $workoutType, exercises: $exercises, minutesRemaining: $minutesRemaining, completed: $completed, total: $total)';
  }
}
