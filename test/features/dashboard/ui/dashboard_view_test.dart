import 'package:example_ui/features/dashboard/ui/dashboard_view.dart';
import 'package:example_ui/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../robots/dashboard_robot.dart';
import '../../../setup/test_helper_mocks.dart';
import '../../../setup/utility.dart';

void main() {
  group("DashboardView - Tests", () {
    late MockNotificationService mockNotificationService;

    late MockAuthService mockAuthService;

    late ToastService toastService;

    late DashboardViewModel viewModel;

    setUp(() {
      mockNotificationService = TestHelperMocks.getMockNotificationService();

      mockAuthService = TestHelperMocks.getMockAuthService();

      toastService = ToastService(mockAuthService);

      viewModel = DashboardViewModel(mockNotificationService, toastService);
    });

    testWidgets('when notification icon pressed then notification modal is shown', (tester) async {
      // Arrange - Setup
      FlutterError.onError = ignoreOverflowErrors;

      final robot = DashboardRobot(tester);

      // Act
      await TestHelperMocks.pumpViewWithModel(const DashboardView(), viewModel, tester);

      await robot.tapNotificationBell();

      // Assert - Result
      robot.expectNotificationModal(mockNotificationService);

      // debugPrint("${find.byType(Text, skipOffstage: false)}");
    });

    testWidgets("when progress card pressed then continue exercise modal appears", (tester) async {
      // Arrange - Setup
      setTestDeviceSize(tester);

      FlutterError.onError = ignoreOverflowErrors;

      final robot = DashboardRobot(tester);

      // Act
      await TestHelperMocks.pumpViewWithModel(const DashboardView(), viewModel, tester);

      await robot.tapProgressCard();

      robot.expectContinueExerciseModal();

      await robot.tapContinueButton();

      robot.expectContinueExerciseModalDismissed();

      // debugPrint("${find.byType(Text, skipOffstage: false)}");
    });
  });
}
