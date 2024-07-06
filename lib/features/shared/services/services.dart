import 'package:example_ui/features/auth/services/auth_service.dart';
import 'package:example_ui/features/shared/services/firebase_service.dart';
import 'package:example_ui/features/shared/services/notification_service.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';

NotificationService get notificationService => NotificationService();

AuthService get authService => AuthService();

ToastService get toastService => ToastService();

FirebaseService get firebaseService => FirebaseService();
