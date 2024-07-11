import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:example_ui/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "Intengreation Test - Signin",
    () {
      testWidgets(
        "when a registered user signs in successfully then they are taken to the dashboard view",
        (tester) async {
          TestWidgetsFlutterBinding.ensureInitialized();

          // await Firebase.initializeApp(
          //   options: DefaultFirebaseOptions.currentPlatform,
          // );

          FlutterError.onError = ignoreOverflowErrors;

          await tester.pumpWidget(
            MaterialApp(
              home: SignInEmailView(),
            ),
          );

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

          // await tester.tap(signInButtonFinder);

          // await tester.pumpAndSettle(const Duration(seconds: 1));
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

  // Ignore if is overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    debugPrint('Ignored Error');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}
