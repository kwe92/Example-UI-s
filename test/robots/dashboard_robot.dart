import 'package:example_ui/features/dashboard/ui/dashboard_view.dart';
import 'package:example_ui/features/dashboard/ui/widgets/progress_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../setup/test_helper_mocks.dart';

class DashboardRobot {
  final WidgetTester _tester;

  const DashboardRobot(this._tester);

  Future<void> tapNotificationBell() async {
    final notificationBellFinder = find.byType(NotificationBellIcon);

    expect(notificationBellFinder, findsOneWidget);

    await _tester.tap(notificationBellFinder);

    await _tester.pumpAndSettle(const Duration(seconds: 2));
  }

  void expectNotificationModal(MockNotificationService mockNotificationService) {
    final notificationFinder = find.text(mockNotificationService.notifications[0].message);

    expect(notificationFinder, findsOneWidget);
  }

  Future<void> tapProgressCard() async {
    final progressCardFinder = find.byType(ProgressCard).first;

    expect(progressCardFinder, findsOneWidget);

    await _tester.tap(progressCardFinder, warnIfMissed: false);

    await _tester.pumpAndSettle(const Duration(seconds: 2));
  }

  void expectContinueExerciseModal() {
    final continueButtonFinder = find.text("Continue Exercise");

    expect(continueButtonFinder, findsOneWidget);
  }

  Future<void> tapContinueButton() async {
    final continueButtonFinder = find.text("Continue Exercise");

    expect(continueButtonFinder, findsOneWidget);

    await _tester.tap(continueButtonFinder);

    await _tester.pumpAndSettle(const Duration(seconds: 2));
  }

  void expectContinueExerciseModalDismissed() {
    final continueButtonFinder = find.text("Continue Exercise");

    expect(continueButtonFinder, findsNothing);
  }
}
