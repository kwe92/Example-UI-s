import 'dart:math';

import 'package:example_ui/examples/workoutApp/app/theme/colors.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/model/workout_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// TODO: Add Workout Class to ProgressCard
class ProgressCard extends StatelessWidget {
  final WorkoutProgress workoutProgress;

  const ProgressCard({
    required this.workoutProgress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 144,
          height: 152,
          decoration: const BoxDecoration(
            color: Color(0xff202023),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: 60,
                height: 60,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Transform.rotate(
                        angle: pi / 4,
                        child: Transform.flip(
                          flipX: true,
                          child: CircularProgressIndicator(
                            value: workoutProgress.completed / workoutProgress.total,
                            strokeWidth: 5,
                            backgroundColor: const Color(0xff303134),
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "${workoutProgress.completed}/${workoutProgress.total}",
                        style: const TextStyle(
                          color: WorkoutAppColors.mainThemeColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "${workoutProgress.workoutType} Workout",
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                "${workoutProgress.minutesRemaining} mins remaining",
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff81809E),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 116,
          top: 6,
          child: SvgPicture.asset(
              "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/dotted_menu_icon.svg"),
        ),
      ],
    );
  }
}
