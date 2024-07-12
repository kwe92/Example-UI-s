import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../robots/auth_robot.dart';
import '../../../../setup/test_helper_mocks.dart';

void main() {
  group(
    "SignInEmailView - ",
    () {
      testWidgets(
        "when signin view loaded then signin widgets are visible",
        (tester) async {
          FlutterError.onError = ignoreOverflowErrors;

          final robot = AuthRobot(tester);

          await robot.pumpSignInScreen();

          await robot.verifySignInView();
        },
      );
    },
  );
}
