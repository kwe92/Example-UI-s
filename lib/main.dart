import 'package:example_ui/app/constants/constants.dart';
import 'package:example_ui/app/theme/workout_app_theme.dart';
import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/features/auth/signIn/email/sign_in_email_view_model.dart';
import 'package:example_ui/features/auth/signIn/password/sign_in_password_view_model.dart';
import 'package:example_ui/features/auth/signUp/signUpSetPassword/set_password_view_model.dart';
import 'package:example_ui/features/auth/signUp/sign_up_view_model.dart';
import 'package:example_ui/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/features/exercise/ui/exercise_view_model.dart';
import 'package:example_ui/features/shared/services/services.dart';
import 'package:example_ui/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: _providers,
      child: MaterialApp(
        navigatorKey: WidgetKey.navigatorKey,
        theme: WorkoutAppTheme.getTheme(),
        // home: const ExerciseView(),
        home: SignInEmailView(),
      ),
    ),
  );
}

List<SingleChildWidget> _providers = [
  ChangeNotifierProvider(
    create: (_) => SignInEmailViewModel(authService),
  ),
  ChangeNotifierProvider(
    create: (_) => SignInPasswordViewModel(authService, toastService),
  ),
  ChangeNotifierProvider(
    create: (context) => SignUpViewModel(authService),
  ),
  ChangeNotifierProvider(
    create: (_) => SetPasswordViewModel(authService, toastService),
  ),
  ChangeNotifierProvider(
    create: (context) => DashboardViewModel(notificationService, toastService),
  ),
  ChangeNotifierProvider(
    create: (context) => ExerciseViewModel(notificationService, toastService),
  )
];
