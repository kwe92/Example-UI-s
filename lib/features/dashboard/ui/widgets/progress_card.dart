import 'package:example_ui/app/theme/colors.dart';
import 'package:example_ui/features/dashboard/model/workout_progress.dart';
import 'package:example_ui/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/features/shared/widgets/progress_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProgressCard extends StatelessWidget {
  final WorkoutProgress workoutProgress;

  const ProgressCard({
    required this.workoutProgress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DashboardViewModel>();
    return GestureDetector(
      onTap: () => viewModel.continueExerciseModal(workoutProgress),
      child: Stack(
        children: [
          Container(
            width: 144,
            height: 152,
            decoration: const BoxDecoration(
              color: WorkoutAppColors.grey3,
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
                    color: WorkoutAppColors.grey0,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 116,
            top: 6,
            child: SvgPicture.asset("/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/dotted_menu_icon.svg"),
          ),
        ],
      ),
    );
  }
}
