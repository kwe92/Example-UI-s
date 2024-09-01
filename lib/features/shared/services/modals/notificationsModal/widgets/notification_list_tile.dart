import 'package:example_ui/app/theme/colors.dart';
import 'package:example_ui/features/dashboard/model/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/clock_icon.svg",
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
    this.color = WorkoutAppColors.grey2,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: !isVertical ? double.maxFinite : thickness,
        height: !isVertical ? thickness : double.maxFinite,
        color: color,
      );
}
