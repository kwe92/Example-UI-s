import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../test/robots/auth_robot.dart';
// TODO: add bash script to run test for you

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "Intengreation Test - Signin",
    () {
      testWidgets(
        "when a registered user signs in successfully then they are taken to the dashboard view",
        (tester) async {
          // FlutterError.onError = ignoreOverflowErrors;

          final robot = AuthRobot(tester);

          await robot.pumpSignInScreen();

          await robot.verifySignInView();

          await robot.enterUserEmail();

          await _delay();

          await robot.continueToPasswordView();

          await robot.verifyPasswordView();

          await robot.enterUserPassword();

          await _delay();

          await robot.signUserIn();

          await _delay();
        },
      );
    },
  );
}

Future<void> _delay([Duration? duration]) async => await Future.delayed(duration ?? const Duration(seconds: 5));
