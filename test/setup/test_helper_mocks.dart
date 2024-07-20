import 'package:example_ui/app/constants/constants.dart';
import 'package:example_ui/features/auth/services/auth_service.dart';
import 'package:example_ui/features/auth/signIn/email/sign_in_email_view_model.dart';
import 'package:example_ui/features/auth/signIn/password/sign_in_password_view_model.dart';
import 'package:example_ui/features/auth/signUp/signUpSetPassword/set_password_view_model.dart';
import 'package:example_ui/features/auth/signUp/sign_up_view_model.dart';
import 'package:example_ui/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/features/shared/services/notification_service.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'test_data.dart';

class MockAuthService extends Mock implements AuthService {}

class MockToastService extends Mock implements ToastService {}

class MockNotificationService extends Mock implements NotificationService {}

class TestHelperMocks {
  TestHelperMocks._();

  static MockAuthService getMockAuthService() {
    // instantiate mock
    final MockAuthService mockService = MockAuthService();

    // mock functions
    when(() => mockService.signInWithEmailAndPassword()).thenAnswer((_) async => await Future.value());

    when(() => mockService.createUserWithEmailAndPassword()).thenAnswer((_) async => await Future.value());

    when(() => mockService.loggedIn).thenReturn(true);

    // return mock

    return mockService;
  }

  static MockToastService getMockToastService() {
    // instantiate mock
    final MockToastService mockService = MockToastService();

    // mock functions
    when(() => mockService.showSnackBar(any())).thenReturn(null);

    // return mock
    return mockService;
  }

  static MockNotificationService getMockNotificationService() {
    // instantiate mock
    final MockNotificationService mockService = MockNotificationService();

    // mock functions
    when(() => mockService.getNotifications()).thenAnswer((_) async => await Future.value());
    when(() => mockService.notifications).thenReturn(testNotifications);

    // return mock
    return mockService;
  }

  static Future<void> pumpViewWithModel<T extends ChangeNotifier>(Widget view, T viewModel, WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => viewModel,
        builder: (context, _) => MaterialApp(
          navigatorKey: WidgetKey.navigatorKey,
          home: view,
        ),
      ),
    );
  }

  static Future<void> pumpViewWithMocks(Widget view, WidgetTester tester) async {
    final mockAuthService = TestHelperMocks.getMockAuthService();
    final mockToastService = TestHelperMocks.getMockToastService();
    final mockNotificationService = TestHelperMocks.getMockNotificationService();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SignInEmailViewModel(mockAuthService),
          ),
          ChangeNotifierProvider(
            create: (context) => SignInPasswordViewModel(mockAuthService, mockToastService),
          ),
          ChangeNotifierProvider(
            create: (context) => DashboardViewModel(mockNotificationService, mockToastService),
          ),
          ChangeNotifierProvider(
            create: (context) => SignUpViewModel(mockAuthService),
          ),
          ChangeNotifierProvider(
            create: (context) => SetPasswordViewModel(mockAuthService, mockToastService),
          ),
        ],
        child: MaterialApp(
          navigatorKey: WidgetKey.navigatorKey,
          home: view,
        ),
      ),
    );
  }

  static Future<void> pumpViewWithProviders(Widget view, List<SingleChildWidget> providers, WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: providers,
        child: MaterialApp(
          navigatorKey: WidgetKey.navigatorKey,
          home: view,
        ),
      ),
    );
  }
}

// TODO: Review this code

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (error) => error.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
      (error) => error.value.toString().startsWith("Unable to load asset"),
    );
  }

  // Ignore if overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    debugPrint('Overflow Error Ignored');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}

Future<void> testDelay([Duration? duration]) async => await Future.delayed(duration ?? const Duration(seconds: 5));
