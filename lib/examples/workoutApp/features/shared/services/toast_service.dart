import 'package:example_ui/examples/workoutApp/app/constants/constants.dart';
import 'package:example_ui/examples/workoutApp/app/theme/workout_app_theme.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/model/notification.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/model/workout_progress.dart';
import 'package:example_ui/examples/workoutApp/features/shared/services/services.dart';
import 'package:example_ui/examples/workoutApp/features/shared/widgets/custom_button.dart';
import 'package:example_ui/examples/workoutApp/features/shared/widgets/progress_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// TODO: refactor as this module is quite big

class ToastService {
  static final ToastService _singleton = ToastService._internal();

  factory ToastService() => _singleton;

  ToastService._internal();

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

  void showSnackBar(String message, [Color? textColor]) => ScaffoldMessenger.of(WidgetKey.navigatorKey.currentState!.context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: textColor),
          ),
        ),
      );

  void continueExerciseBottomModal(WorkoutProgress workoutProgress) => showModalBottomSheet(
        context: WidgetKey.navigatorKey.currentState!.context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Color(0xff202023),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                )),
            height: 440,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 64,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Color(0xffF1F2F6),
                      borderRadius: BorderRadius.all(
                        Radius.circular(64 / 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    ProgressCounter(workoutProgress: workoutProgress),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workoutProgress.workoutType,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "${workoutProgress.minutesRemaining.toString()} min remaining",
                          style: const TextStyle(
                            color: Color(0xff81809E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Exercises",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.maxFinite,
                  height: 126,
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                      Color(0xff81809E),
                      Colors.black54,
                    ]).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height * 1.75),
                    ),
                    child: ListView.separated(
                      itemCount: workoutProgress.exercises.length,
                      itemBuilder: (context, i) {
                        return Row(
                          children: [
                            Container(
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                color: Color(0xff81809E),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              workoutProgress.exercises[i],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 4),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  onTap: () => Navigator.pop(context),
                  label: "Continue Exercise",
                ),
              ],
            ),
          );
        },
      );

  Future<bool> forgotPasswordModal() async {
    return await showDialog<bool>(
          context: WidgetKey.navigatorKey.currentState!.context,
          builder: (context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                width: double.maxFinite,
                height: 250,
                decoration: const BoxDecoration(
                  color: Color(0xff202023),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Are you sure you want to reset your password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "an email will be sent to: " "${authService.tempUser.email}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: CustomButton(
                            onTap: () => Navigator.pop(context, true),
                            label: "Yes",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: CustomButton(
                            buttonTheme: secondaryButtonTheme,
                            onTap: () => Navigator.pop(context, false),
                            label: "No",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }
}

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
