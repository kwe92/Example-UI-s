import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/features/auth/signIn/password/sign_in_password_view_model.dart';
import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../../../setup/test_helper_mocks.dart';

void main() {
  group(
    "Intengreation Test - Signin",
    () {
      testWidgets(
        "when a registered user signs in successfully then they are taken to the dashboard view",
        (tester) async {
          FlutterError.onError = ignoreOverflowErrors;

          // pumpSignInScreen

          final signInTextFinder = find.text("Sign In");

          // debugPrint("$textFinder");

          final emailTextFieldFinder = find.byType(TextFormField);

          // debugPrint("$emailTextFieldFinder");

          final continueButtonFinder = find.byType(CustomButton);

          // debugPrint("$continueButtonFinder");

          expect(signInTextFinder, findsOneWidget);

          expect(emailTextFieldFinder, findsOneWidget);

          expect(continueButtonFinder, findsOneWidget);

          await tester.enterText(emailTextFieldFinder, "test1101@gmail.com");

          await tester.tap(continueButtonFinder);

          await tester.pumpAndSettle(const Duration(seconds: 1));

          // debugPrint("${find.byType(Text)}");

          final passwordTextFinder = find.text("Password");

          expect(passwordTextFinder, findsOneWidget);

          final passwordTextFormField = find.byType(TextFormField, skipOffstage: false).last;

          // debugPrint("${find.byType(TextFormField)}");

          expect(passwordTextFormField, findsOneWidget);

          // await tester.drag(passwordTextFormField, Offset(-500, 0));

          await tester.enterText(passwordTextFormField, "Leibei11!!");

          final signInButtonFinder = find.byType(CustomButton);

          expect(signInButtonFinder, findsOneWidget);

          await tester.tap(signInButtonFinder);

          await tester.pumpAndSettle(const Duration(seconds: 1));

          debugPrint("${find.byType(Text)}");
        },
      );
    },
  );
}

class AuthRobot {
  final WidgetTester tester;

  AuthRobot(this.tester);

  Future<void> pumpSignInScreen() async {
    final mockAuthService = TestHelperMocks.getMockAuthService();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SignInPasswordViewModel(mockAuthService),
          ),
        ],
        child: MaterialApp(
          home: SignInEmailView(),
        ),
      ),
    );
  }
}
