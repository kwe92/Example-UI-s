import 'package:example_ui/features/dashboard/model/notification.dart';
import 'package:example_ui/features/shared/services/notification_service.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';
import 'package:example_ui/features/shared/utility/extended_change_notifier.dart';

class ExerciseViewModel extends ExtendedChangeNotifier {
  final ToastService _toastService;

  final NotificationService _notificationService;

  List<AppNotification> get notifications => _notificationService.notifications;

  ExerciseViewModel(this._notificationService, this._toastService);

  Future<void> notificationsModal() async => await _toastService.notificationsModal(notifications: notifications);

  Future<void> getNotifications() async {
    setBusy(true);
    await _notificationService.getNotifications();
    setBusy(false);
  }
}
