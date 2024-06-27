import 'package:example_ui/examples/workoutApp/app/constants/constants.dart';
import 'package:example_ui/examples/workoutApp/app/theme/workout_app_theme.dart';
import 'package:example_ui/examples/workoutApp/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/ui/dashboard_view.dart';
import 'package:example_ui/examples/workoutApp/features/navigator/navigator_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      navigatorKey: WidgetKey.navigatorKey,
      theme: WorkoutAppTheme.getTheme(),
      home: const NavigatorView(),
      // home: SignInEmailView(),
    ),
  );
}
