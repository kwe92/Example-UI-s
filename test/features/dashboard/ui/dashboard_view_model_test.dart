import 'package:example_ui/features/dashboard/ui/dashboard_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../setup/test_data.dart';
import '../../../setup/test_helper_mocks.dart';

void main() {
  test('when getNotifications called then notifications are fetched', () async {
    //  Arrange
    final mockNotificationService = TestHelperMocks.getMockNotificationService();

    final mockToastService = TestHelperMocks.getMockToastService();

    final viewModel = DashboardViewModel(mockNotificationService, mockToastService);

    // Act
    viewModel.getNotifications();

    // Assert

    expect(viewModel.notifications, testNotifications);
  });
}
