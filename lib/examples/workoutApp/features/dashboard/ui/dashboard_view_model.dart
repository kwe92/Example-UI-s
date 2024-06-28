import 'package:example_ui/examples/workoutApp/features/dashboard/model/exercise_category.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/model/notification.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/model/workout_progress.dart';
import 'package:example_ui/examples/workoutApp/features/services/notification_service.dart';
import 'package:flutter/material.dart';

// TODO: add exercises place holder data for WorkoutProgress instances

class DashboardViewModel extends ChangeNotifier {
  int _selectedCategory = 0;

  final _categories = ["All", "Warm Up", "Yoga", "Biceps", "Chest", "Legs"];

  bool _isBusy = false;

  int get selectedCategory => _selectedCategory;

  List<String> get categories => _categories;

  bool get isBusy => _isBusy;

  List<AppNotification> get notifications => notificationService.notifications;

  List<WorkoutProgress> get workoutProgress => [
        WorkoutProgress(
          workoutType: "Chest Workout",
          minutesRemaining: 15,
          completed: 5,
          total: 12,
          exercises: [
            "Standard Push-Ups",
            "Legs Crossed Push-Ups",
            "Decline Push-Ups",
            "Plyometric Push-Ups",
            "Wide Push-Ups",
            "Diamond Push-Ups",
            "Shuffle Push-Ups",
            "One-leg Push-Ups",
            "Off-set Push-Ups",
            "Spider-Man Push-Ups",
            "Incline push-Ups",
            "Archer push Ups",
          ],
        ),
        WorkoutProgress(
          workoutType: "Legs Workout",
          minutesRemaining: 23,
          completed: 3,
          total: 20,
          exercises: [],
        ),
        WorkoutProgress(
          workoutType: "Back Workout",
          minutesRemaining: 8,
          completed: 10,
          total: 12,
          exercises: [],
        ),
        WorkoutProgress(
          workoutType: "Biceps Workout",
          minutesRemaining: 5,
          completed: 7,
          total: 8,
          exercises: [],
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

  void setBusy(bool isBusy) {
    _isBusy = isBusy;
    notifyListeners();
  }

  Future<void> getNotifications() async {
    setBusy(true);
    await notificationService.getNotifications();
    setBusy(false);
  }
}
