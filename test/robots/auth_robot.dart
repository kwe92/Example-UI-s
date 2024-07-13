import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// TODO: Think about how many robots you would like to have \ one per feature? What about features with multiple views like aduthentication

class AuthRobot {
  final WidgetTester tester;

  AuthRobot(this.tester);

  Future<void> enterRegisteredUserEmail() async {
    final emailTextFieldFinder = find.byType(TextFormField);

    await tester.enterText(emailTextFieldFinder, "test1101@gmail.com");
  }

  Future<void> enterRegisteredUserPassword() async {
    final passwordTextFormField = find.byType(TextFormField, skipOffstage: false).last;

    await tester.enterText(passwordTextFormField, "Password11!!");
  }

  Future<void> tapSignInButton() async {
    final signInButtonFinder = find.byType(CustomButton);

    expect(signInButtonFinder, findsOneWidget);

    await tester.tap(signInButtonFinder);

    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> tapCreateAccountButton() async {
    final createAccountButtonFinder = find.byType(TextButton);

    expect(createAccountButtonFinder, findsOneWidget);

    await tester.tap(createAccountButtonFinder);

    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> enterNewUserNameAndEmail() async {
    final signUpTextFinder = find.text("Sign Up");

    final nameTextFieldFinder = find.byType(TextField).first;

    final emailTextFieldFinder = find.byType(TextField).last;

    expect(nameTextFieldFinder, findsOneWidget);

    expect(emailTextFieldFinder, findsOneWidget);

    expect(signUpTextFinder, findsOneWidget);

    await tester.enterText(nameTextFieldFinder, "Shoto Todoroki");

    await tester.enterText(emailTextFieldFinder, "shotostyle@myhero.io");
  }

  Future<void> tapContinueButton() async {
    Finder continueButtonFinder = find.byType(CustomButton);

    expect(continueButtonFinder, findsOneWidget);

    await tester.tap(continueButtonFinder);

    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> enterNewUserPassword() async {
    final setPasswordTextFinder = find.text("Set Password");

    final passwordTextFormFieldFinder = find.byType(TextFormField).first;

    final confirmPasswordTextFormFieldFinder = find.byType(TextFormField).last;

    expect(setPasswordTextFinder, findsOneWidget);

    expect(passwordTextFormFieldFinder, findsOneWidget);

    expect(confirmPasswordTextFormFieldFinder, findsOneWidget);

    await tester.enterText(passwordTextFormFieldFinder, "Endeavor11!!");

    await tester.enterText(confirmPasswordTextFormFieldFinder, "Endeavor11!!");
  }

  void expectDashboardText() async {
    final dashboardText = find.text("Start Strong and Set Your Fitness Goals");

    expect(dashboardText, findsOneWidget);
  }
}
