import 'package:example_ui/examples/workoutApp/app/constants/constants.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/model/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// TODO: user getit or a singleton pattern instead of passing around a global variable

final toastService = ToastService();

class ToastService {
  // TODO: should be refactored to be polymorphic and should parse out the notification modal
  Future<T?> notificationsModal<T>({required List<AppNotification> notifications, Color barrierColor = Colors.transparent}) {
    return showDialog<T>(
      barrierColor: barrierColor,
      context: WidgetKey.navigatorKey.currentState!.context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.only(
            right: 24,
            top: 62,
          ),
          alignment: Alignment.topRight,
          child: Container(
            width: 300,
            height: 326,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xff29292D), // TODO: check if color is used anywhere else
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SvgPicture.asset(
                      "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/check_icon.svg",
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) => NotificationListTile(notification: notifications[index]),
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// TODO: should be in ita own module

class NotificationListTile extends StatelessWidget {
  final AppNotification notification;

  const NotificationListTile({
    required this.notification,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Line(),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/clock_icon.svg",
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 236,
              height: 42,
              child: Text(
                notification.message,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class Line extends StatelessWidget {
  final bool isVertical;
  final double thickness;
  final Color color;
  const Line({
    this.isVertical = false,
    this.thickness = 1,
    this.color = const Color(0xff323239),
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: !isVertical ? double.maxFinite : thickness,
        height: !isVertical ? thickness : double.maxFinite,
        color: color,
      );
}
