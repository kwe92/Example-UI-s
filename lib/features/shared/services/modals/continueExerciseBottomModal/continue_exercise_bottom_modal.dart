import 'package:example_ui/app/theme/colors.dart';
import 'package:example_ui/features/dashboard/model/workout_progress.dart';
import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:example_ui/features/shared/widgets/progress_counter.dart';
import 'package:flutter/material.dart';

class ContinueExerciseBottomModal extends StatelessWidget {
  final WorkoutProgress workoutProgress;

  const ContinueExerciseBottomModal({
    required this.workoutProgress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.maxFinite,
      decoration: const BoxDecoration(
          color: WorkoutAppColors.grey3,
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
                color: Color(0xffF1F2F6), // one off
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
                      color: WorkoutAppColors.grey0,
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
                WorkoutAppColors.grey0,
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
                          color: WorkoutAppColors.grey0,
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
  }
}
