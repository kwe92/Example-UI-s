import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/features/auth/signIn/password/sign_in_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example_ui/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "Intengreation Test - Signin",
    () {
      testWidgets(
        "when a registered user signs in successfully then they are taken to the dashboard view",
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: SignInEmailView(),
            ),
          );
        },
      );
    },
  );
}

class AuthRobot {
  final WidgetTester tester;

  AuthRobot(this.tester);

  Future<void> pumpSignInScreen() async {
    await tester.pumpWidget(
      MaterialApp(
        home: SignInEmailView(),
      ),
    );
  }
}
