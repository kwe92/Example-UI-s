import 'package:example_ui/app/constants/constants.dart';
import 'package:example_ui/features/dashboard/model/workout_progress.dart';
import 'package:example_ui/features/shared/services/modals/continueExerciseBottomModal/continue_exercise_bottom_modal.dart';
import 'package:example_ui/features/shared/services/modals/forgotPasswordModal/forgot_password_modal.dart';
import 'package:example_ui/features/shared/services/modals/notificationsModal/notifications_modal.dart';
import 'package:flutter/material.dart';

/// Responsible for showing banners, popups, and modals.
class ToastService {
  static ToastService? _singleton;

  factory ToastService() {
    _singleton ??= ToastService._internal();
    return _singleton!;
  }

  ToastService._internal();

  void showSnackBar(String message, [Color? textColor]) => ScaffoldMessenger.of(WidgetKey.navigatorKey.currentState!.context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: textColor),
          ),
        ),
      );

  Future<T?> notificationsModal<T>({Color barrierColor = Colors.transparent}) => showDialog<T>(
        barrierColor: barrierColor,
        context: WidgetKey.navigatorKey.currentState!.context,
        builder: (context) => const NotificationsModal(),
      );

  void continueExerciseBottomModal(WorkoutProgress workoutProgress) => showModalBottomSheet(
        context: WidgetKey.navigatorKey.currentState!.context,
        builder: (context) => ContinueExerciseBottomModal(workoutProgress: workoutProgress),
      );

  Future<bool> forgotPasswordModal() async =>
      await showDialog<bool>(
        context: WidgetKey.navigatorKey.currentState!.context,
        builder: (context) => const ForgotPasswordModal(),
      ) ??
      false;
}
