import 'package:example_ui/examples/workoutApp/app/theme/workout_app_theme.dart';
import 'package:example_ui/examples/workoutApp/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: WorkoutAppTheme.getTheme(),
      home: SignInEmailView(),
    ),
  );
}
