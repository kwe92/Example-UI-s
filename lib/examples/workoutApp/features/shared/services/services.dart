import 'package:example_ui/examples/workoutApp/features/auth/services/auth_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/services/firebase_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/services/notification_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/services/toast_service.dart';

NotificationService get notificationService => NotificationService();

AuthService get authService => AuthService();

ToastService get toastService => ToastService();

FirebaseService get firebaseService => FirebaseService();
