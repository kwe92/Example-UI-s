import 'package:example_ui/features/auth/signUp/sign_up_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/robots/auth_robot.dart';
import '../test/setup/test_helper_mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Integration Test - Signin", () {
    testWidgets("when a user signs up successfully then they are taken to the dashboard", (tester) async {
      final authRobot = AuthRobot(tester);

      await TestHelperMocks.pumpViewWithMocks(SignUpView(), tester);

      await authRobot.enterNewUserNameAndEmail();

      await testDelay();

      await authRobot.tapContinueButton();

      await testDelay();

      await authRobot.enterNewUserPassword();

      await testDelay();

      await authRobot.tapContinueButton();

      await testDelay();

      authRobot.expectDashboardText();

      await testDelay();
    });
  });
}
