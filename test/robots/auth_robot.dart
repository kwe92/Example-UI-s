import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/features/auth/signIn/email/sign_in_email_view_model.dart';
import 'package:example_ui/features/auth/signIn/password/sign_in_password_view_model.dart';
import 'package:example_ui/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../setup/test_helper_mocks.dart';

class AuthRobot {
  final WidgetTester tester;

  AuthRobot(this.tester);

  Future<void> pumpSignInScreen() async {
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
            create: (context) => DashboardViewModel(mockNotificationService),
          ),
        ],
        child: MaterialApp(
          home: SignInEmailView(),
        ),
      ),
    );
  }

  Future<void> verifySignInView() async {
    final signInTextFinder = find.text("Sign In");

    // debugPrint("$textFinder");

    final emailTextFieldFinder = find.byType(TextFormField);

    // debugPrint("$emailTextFieldFinder");

    final continueButtonFinder = find.byType(CustomButton);

    // debugPrint("$continueButtonFinder");

    expect(signInTextFinder, findsOneWidget);

    expect(emailTextFieldFinder, findsOneWidget);

    expect(continueButtonFinder, findsOneWidget);
  }

  Future<void> enterUserEmail() async {
    final emailTextFieldFinder = find.byType(TextFormField);

    await tester.enterText(emailTextFieldFinder, "test1101@gmail.com");
  }

  Future<void> continueToPasswordView() async {
    final continueButtonFinder = find.byType(CustomButton);

    await tester.tap(continueButtonFinder);

    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> verifyPasswordView() async {
    final passwordTextFinder = find.text("Password");

    expect(passwordTextFinder, findsOneWidget);

    final passwordTextFormField = find.byType(TextFormField, skipOffstage: false).last;

    expect(passwordTextFormField, findsOneWidget);
  }

  Future<void> enterUserPassword() async {
    final passwordTextFormField = find.byType(TextFormField, skipOffstage: false).last;

    await tester.enterText(passwordTextFormField, "Password11!!");
  }

  Future<void> signUserIn() async {
    final signInButtonFinder = find.byType(CustomButton);

    expect(signInButtonFinder, findsOneWidget);

    await tester.tap(signInButtonFinder);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    // debugPrint("${find.byType(Text)}");
  }
}
