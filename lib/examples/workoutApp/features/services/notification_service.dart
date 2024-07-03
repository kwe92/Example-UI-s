import 'package:example_ui/examples/workoutApp/features/dashboard/model/notification.dart';
import 'package:flutter/material.dart';
// TODO: use getit or a singleton pattern instead of passing around a global variable

final NotificationService notificationService = NotificationService();

class NotificationService extends ChangeNotifier {
  List<AppNotification> _notifications = [];

  List<AppNotification> get notifications => _notifications;

  Future<void> getNotifications() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    _notifications = const [
      AppNotification(id: 0, message: "Don't forget to hydrate during your workout"),
      AppNotification(id: 3, message: "Congrats on completing your first week  of workouts!"),
      AppNotification(id: 1, message: "It's HIIT o'clock! Time for a quick and intense workout"),
      AppNotification(id: 2, message: "Hey fitness enthusiast, time to log your latest workout"),
    ];

    notifyListeners();
  }
}
