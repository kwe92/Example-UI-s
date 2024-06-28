import 'package:example_ui/examples/workoutApp/features/dashboard/model/workout_progress.dart';
import 'package:example_ui/examples/workoutApp/features/services/toast_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/widgets/progress_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProgressCard extends StatelessWidget {
  final WorkoutProgress workoutProgress;

  const ProgressCard({
    required this.workoutProgress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toastService.continueExerciseBottomModal(workoutProgress),
      child: Stack(
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
                ProgressCounter(workoutProgress: workoutProgress),
                const SizedBox(height: 12),
                Text(
                  textAlign: TextAlign.start,
                  workoutProgress.workoutType,
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
      ),
    );
  }
}
