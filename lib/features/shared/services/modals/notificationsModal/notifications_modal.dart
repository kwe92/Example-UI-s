import 'package:example_ui/app/theme/colors.dart';
import 'package:example_ui/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/features/shared/services/modals/notificationsModal/widgets/notification_list_tile.dart';
import 'package:example_ui/features/shared/services/modals/notificationsModal/widgets/shimmer_notification_list_tile.dart';
import 'package:example_ui/features/shared/transitions/fade_wrapper.dart';
import 'package:example_ui/features/shared/widgets/shimmer_provider.dart';
import 'package:example_ui/features/shared/widgets/shimmer_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NotificationsModal extends StatelessWidget {
  const NotificationsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeWrapper(
      child: Consumer<DashboardViewModel>(
        builder: (BuildContext context, DashboardViewModel viewModel, _) {
          return ShimmerProvider(
            highlightColor: WorkoutAppColors.grey1,
            baseColor: WorkoutAppColors.grey2,
            child: Dialog(
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
                  color: Color(0xff29292D),
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
                          "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/check_icon.svg",
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: !viewModel.isBusy
                          ? ListView.separated(
                              itemCount: viewModel.notifications.length,
                              itemBuilder: (context, index) => NotificationListTile(notification: viewModel.notifications[index]),
                              separatorBuilder: (context, index) => const SizedBox(height: 12),
                            )
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (context, index) => ShimmerWrapper(
                                isLoading: viewModel.isBusy,
                                child: const ShimmerNotificationListTile(),
                              ),
                              separatorBuilder: (context, index) => const SizedBox(height: 12),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
