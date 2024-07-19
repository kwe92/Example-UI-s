import 'package:example_ui/features/dashboard/ui/dashboard_view.dart';
import 'package:example_ui/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/features/dashboard/ui/widgets/progress_card.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../setup/test_helper_mocks.dart';

void main() {
  group("DashboardView - Tests", () {
    final MockNotificationService mockNotificationService = TestHelperMocks.getMockNotificationService();

    final MockAuthService mockAuthService = TestHelperMocks.getMockAuthService();

    final toastService = ToastService(mockAuthService);

    final viewModel = DashboardViewModel(mockNotificationService, toastService);

    Future<void> pumpDashboardView(WidgetTester tester) async =>
        await TestHelperMocks.pumpViewWithModel(const DashboardView(), viewModel, tester);

    testWidgets('when notification icon pressed then notification modal is shown', (tester) async {
      FlutterError.onError = ignoreOverflowErrors;

      await pumpDashboardView(tester);

      await tester.pumpAndSettle();

      // debugPrint("${find.byType(Text, skipOffstage: false)}");

      final notificationBellFinder = find.byType(NotificationBellIcon);

      expect(notificationBellFinder, findsOneWidget);

      await tester.tap(notificationBellFinder);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final notificationFinder = find.text(mockNotificationService.notifications[0].message);

      expect(notificationFinder, findsOneWidget);

      // debugPrint("${find.byType(Text, skipOffstage: false)}");
    });

    testWidgets("when progress card pressed then continue exercise modal appears", (tester) async {
      FlutterError.onError = ignoreOverflowErrors;

      await pumpDashboardView(tester);

      final progressCardFinder = find.byType(ProgressCard).first;

      expect(progressCardFinder, findsOneWidget);

      await tester.tap(progressCardFinder);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final continueButtonFinder = find.text("Continue Exercise");

      expect(continueButtonFinder, findsOneWidget);

      // debugPrint("${find.byType(Text, skipOffstage: false)}");
    });
  });
}
