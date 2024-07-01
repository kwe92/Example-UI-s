import 'package:example_ui/examples/workoutApp/app/constants/constants.dart';
import 'package:example_ui/examples/workoutApp/app/theme/workout_app_theme.dart';
import 'package:example_ui/examples/workoutApp/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/examples/workoutApp/features/auth/signUp/signUpSetPassword/set_password_view.dart';
import 'package:example_ui/examples/workoutApp/features/auth/signUp/sign_up_view.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/ui/dashboard_view.dart';
import 'package:example_ui/examples/workoutApp/features/navigator/navigator_view.dart';
import 'package:example_ui/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      navigatorKey: WidgetKey.navigatorKey,
      theme: WorkoutAppTheme.getTheme(),
      // home: NavigatorView(),
      home: SignInEmailView(),
      // home: const DashboardView(),
      // home: SignUpView(),
    ),
  );
}
