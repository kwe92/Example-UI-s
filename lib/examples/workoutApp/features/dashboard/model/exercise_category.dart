import 'dart:convert';

class ExerciseCategory {
  final String name;
  final int exerciseCount;
  final int totalMinutes;
  final String image;

  const ExerciseCategory({
    required this.name,
    required this.exerciseCount,
    required this.totalMinutes,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'exerciseCount': exerciseCount,
      'totalMinutes': totalMinutes,
      'image': image,
    };
  }

  factory ExerciseCategory.fromMap(Map<String, dynamic> map) {
    return ExerciseCategory(
      name: map['name'] ?? '',
      exerciseCount: map['exerciseCount']?.toInt() ?? 0,
      totalMinutes: map['totalMinutes']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseCategory.fromJson(String source) => ExerciseCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExerciseCategory(name: $name, exerciseCount: $exerciseCount, totalMinutes: $totalMinutes, image: $image)';
  }
}
