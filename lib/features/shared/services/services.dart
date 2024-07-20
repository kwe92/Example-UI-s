import 'package:example_ui/features/auth/services/auth_service.dart';
import 'package:example_ui/features/shared/services/firebase_service.dart';
import 'package:example_ui/features/shared/services/notification_service.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

// lazy global services

NotificationService get notificationService => NotificationService();

FirebaseService get firebaseService => FirebaseService(FirebaseAuth.instance);

AuthService get authService => AuthService(firebaseService);

ToastService get toastService => ToastService(authService);
