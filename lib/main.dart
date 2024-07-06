import 'package:example_ui/app/constants/constants.dart';
import 'package:example_ui/app/theme/workout_app_theme.dart';
import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
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
      home: SignInEmailView(),
    ),
  );
}
