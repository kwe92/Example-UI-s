import 'package:example_ui/examples/workoutApp/features/dashboard/model/exercise_category.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/model/workout_progress.dart';
import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  int _selectedCategory = 0;

  final _categories = ["All", "Warm Up", "Yoga", "Biceps", "Chest", "Legs"];

  int get selectedCategory => _selectedCategory;

  List<String> get categories => _categories;

  List<WorkoutProgress> get workoutProgress => [
        WorkoutProgress(
          workoutType: "Chest",
          minutesRemaining: 15,
          completed: 5,
          total: 12,
        ),
        WorkoutProgress(
          workoutType: "Legs",
          minutesRemaining: 23,
          completed: 3,
          total: 20,
        ),
        WorkoutProgress(
          workoutType: "Back",
          minutesRemaining: 8,
          completed: 10,
          total: 12,
        ),
        WorkoutProgress(
          workoutType: "Biceps",
          minutesRemaining: 5,
          completed: 7,
          total: 8,
        ),
      ];

  List<ExerciseCategory> exerciseCategories = const [
    ExerciseCategory(
      name: "Full Body Warm Up",
      exerciseCount: 20,
      totalMinutes: 22,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/warm_up_icon.png",
    ),
    ExerciseCategory(
      name: "Strength Exercise",
      exerciseCount: 12,
      totalMinutes: 14,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/strength_exercise_icon.png",
    ),
    ExerciseCategory(
      name: "Both Side Plank",
      exerciseCount: 15,
      totalMinutes: 18,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/plank_exercise_icon.png",
    ),
    ExerciseCategory(
      name: "Abs Workout",
      exerciseCount: 16,
      totalMinutes: 18,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/abs_exercise_icon.png",
    ),
    ExerciseCategory(
      name: "Torso and Trap Workout",
      exerciseCount: 8,
      totalMinutes: 10,
      image:
          "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/torso_and_trap_exercise_icon.png",
    ),
    ExerciseCategory(
      name: "Lower Back Exercise",
      exerciseCount: 14,
      totalMinutes: 18,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/lower_back_exercise_icon.png",
    ),
  ];

  void setSelectedCategory(int index) {
    _selectedCategory = index;

    debugPrint("$_selectedCategory");

    notifyListeners();
  }
}
