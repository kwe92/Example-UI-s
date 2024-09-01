import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShimmerNotificationListTile extends StatelessWidget {
  const ShimmerNotificationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/clock_icon.svg",
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 236,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 118,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
