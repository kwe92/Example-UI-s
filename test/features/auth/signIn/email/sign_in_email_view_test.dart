import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../setup/test_helper_mocks.dart';

void main() {
  group(
    "SignInEmailView - Test",
    () {
      testWidgets(
        "when user enters valid email then they are taken to the password view",
        (tester) async {
          FlutterError.onError = ignoreOverflowErrors;

          await TestHelperMocks.pumpViewWithMocks(SignInEmailView(), tester);

          await tester.enterText(find.byType(TextFormField), "test1104@gmail.com");

          await tester.tap(find.byType(CustomButton));

          await tester.pumpAndSettle(const Duration(seconds: 2));

          expect(find.text("Enter password"), findsOneWidget);
        },
      );

      testWidgets(
        "when user enters invalid email then they are not taken to the password view and they are prompted to enter a valid password",
        (tester) async {
          FlutterError.onError = ignoreOverflowErrors;

          await TestHelperMocks.pumpViewWithMocks(SignInEmailView(), tester);

          await tester.enterText(find.byType(TextFormField), "I AM NOT AN EMAIL!");

          await tester.tap(find.byType(CustomButton));

          await tester.pumpAndSettle(const Duration(seconds: 2));

          expect(find.text("Enter password"), findsNothing);

          expect(find.text("enter a valid email."), findsOneWidget);
        },
      );

      testWidgets(
        "when user taps create account text button then they are taken to the signup view",
        (tester) async {
          FlutterError.onError = ignoreOverflowErrors;

          await TestHelperMocks.pumpViewWithMocks(SignInEmailView(), tester);

          await tester.tap(find.byType(TextButton));

          await tester.pumpAndSettle(const Duration(seconds: 2));

          expect(find.text("Sign Up"), findsOneWidget);
        },
      );
    },
  );
}
