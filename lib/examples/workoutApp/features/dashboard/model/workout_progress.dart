import 'dart:convert';

class WorkoutProgress {
  final String workoutType;
  final int minutesRemaining;
  int completed;
  final int total;

  WorkoutProgress({
    required this.workoutType,
    required this.minutesRemaining,
    required this.completed,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'workoutType': workoutType,
      'minutesRemaining': minutesRemaining,
      'completed': completed,
      'total': total,
    };
  }

  factory WorkoutProgress.fromMap(Map<String, dynamic> map) {
    return WorkoutProgress(
      workoutType: map['workoutType'] ?? '',
      minutesRemaining: map['minutesRemaining']?.toInt() ?? 0,
      completed: map['completed']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutProgress.fromJson(String source) => WorkoutProgress.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WorkoutProgress(workoutType: $workoutType, minutesRemaining: $minutesRemaining, completed: $completed, total: $total)';
  }
}
