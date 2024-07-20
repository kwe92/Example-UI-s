import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/features/auth/signIn/email/sign_in_email_view_model.dart';
import 'package:example_ui/features/auth/signIn/password/sign_in_password_view_model.dart';
import 'package:example_ui/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import '../test/robots/super_robot.dart';
import '../test/setup/test_helper_mocks.dart';
import '../test/setup/utility.dart';
// TODO: add bash script to run test for you

// TODO: change description as the dashboard is now tested\

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "Integration Test - Signin",
    () {
      testWidgets(
        "when a registered user signs in successfully then they are taken to the dashboard view",
        (tester) async {
          final r = SuperRobot(tester);

          setTestDeviceSize(tester);

          final mockAuthService = TestHelperMocks.getMockAuthService();
          final mockToastService = TestHelperMocks.getMockToastService();
          final mockNotificationService = TestHelperMocks.getMockNotificationService();

          final ToastService toastService = ToastService(mockAuthService);

          await TestHelperMocks.pumpViewWithProviders(
              SignInEmailView(),
              [
                ChangeNotifierProvider(
                  create: (_) => SignInEmailViewModel(mockAuthService),
                ),
                ChangeNotifierProvider(
                  create: (context) => SignInPasswordViewModel(mockAuthService, mockToastService),
                ),
                ChangeNotifierProvider(
                  create: (context) => DashboardViewModel(mockNotificationService, toastService),
                ),
              ],
              tester);

          await r.authRobot.enterRegisteredUserEmail();

          await testDelay();

          await r.authRobot.tapContinueButton();

          await r.authRobot.enterRegisteredUserPassword();

          await testDelay();

          await r.authRobot.tapSignInButton();

          await testDelay();

          await r.dashboardRobot.tapNotificationBell();

          await testDelay();

          await r.dashboardRobot.tapProgressCard();

          await testDelay();

          await r.dashboardRobot.tapProgressCard();

          await testDelay();

          await r.dashboardRobot.tapContinueButton();

          await testDelay();
        },
      );
    },
  );
}
