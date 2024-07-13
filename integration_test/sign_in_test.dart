import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../test/robots/auth_robot.dart';
import '../test/setup/test_helper_mocks.dart';
// TODO: add bash script to run test for you

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "Intengreation Test - Signin",
    () {
      testWidgets(
        "when a registered user signs in successfully then they are taken to the dashboard view",
        (tester) async {
          final robot = AuthRobot(tester);

          await TestHelperMocks.pumpViewWithMocks(SignInEmailView(), tester);

          await robot.enterRegisteredUserEmail();

          await testDelay();

          await robot.tapContinueButton();

          await robot.enterRegisteredUserPassword();

          await testDelay();

          await robot.tapSignInButton();

          await testDelay();
        },
      );
    },
  );
}
