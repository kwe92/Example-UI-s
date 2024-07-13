import 'package:example_ui/features/auth/signUp/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../robots/auth_robot.dart';
import '../../../setup/test_helper_mocks.dart';

void main() {
  group("SignupView - Test", () {
    testWidgets("when a user signs up successfully then they are taken to the dashboard", (tester) async {
      FlutterError.onError = ignoreOverflowErrors;

      final authRobot = AuthRobot(tester);

      await TestHelperMocks.pumpViewWithMocks(SignUpView(), tester);

      await authRobot.enterNewUserNameAndEmail();

      await authRobot.tapContinueButton();

      await authRobot.enterNewUserPassword();

      await authRobot.tapContinueButton();

      authRobot.expectDashboardText();
    });

    testWidgets("when user enters invalid email then they are not taken to set password view and they are prompted to enter valid email",
        (tester) async {
      FlutterError.onError = ignoreOverflowErrors;

      final authRobot = AuthRobot(tester);

      await TestHelperMocks.pumpViewWithMocks(SignUpView(), tester);

      final emailTextFieldFinder = find.byType(TextField).last;

      expect(emailTextFieldFinder, findsOneWidget);

      await tester.enterText(emailTextFieldFinder, "shoto style icy hot");

      await authRobot.tapContinueButton();

      expect(find.text("enter a valid email."), findsOneWidget);
    });

    // TODO: the bellow test should be moved to SetPasswordView

//     testWidgets("when user enters invalid password then they are not taken to dashboard view and they are prompted to enter valid password",
//         (tester) async {
//       FlutterError.onError = ignoreOverflowErrors;

//       final authRobot = AuthRobot(tester);

//       await TestHelperMocks.pumpViewWithMocks(SignUpView(), tester);

//       await authRobot.enterRegisteredUserEmail();

//       final passwordTextFieldFinder = find.byType(TextField).first;

//       final confirmPasswordTextFieldFinder = find.byType(TextField).last;

//       expect(passwordTextFieldFinder, findsOneWidget);

//       expect(confirmPasswordTextFieldFinder, findsOneWidget);

//       await tester.enterText(passwordTextFieldFinder, "");

//       await tester.enterText(confirmPasswordTextFieldFinder, "");

//       await authRobot.tapContinueButton();

//       expect(find.text("password can't be empty."), findsOneWidget);
//     });
  });
}
