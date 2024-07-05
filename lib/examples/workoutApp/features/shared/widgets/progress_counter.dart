import 'dart:math';

import 'package:example_ui/examples/workoutApp/app/theme/colors.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/model/workout_progress.dart';
import 'package:flutter/material.dart';

class ProgressCounter extends StatelessWidget {
  final WorkoutProgress workoutProgress;

  const ProgressCounter({required this.workoutProgress, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  backgroundColor: const Color(0xff303134), // one off
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
    );
  }
}
