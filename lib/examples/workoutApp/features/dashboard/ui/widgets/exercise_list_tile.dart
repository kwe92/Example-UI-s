import 'package:example_ui/examples/workoutApp/app/theme/colors.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/model/exercise_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseListTile extends StatelessWidget {
  final ExerciseCategory category;

  const ExerciseListTile({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 80,
      padding: const EdgeInsets.only(
        left: 16,
        right: 26,
      ),
      decoration: const BoxDecoration(
        color: WorkoutAppColors.grey3,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(category.image),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${category.exerciseCount} Exercises",
                        style: const TextStyle(
                          color: WorkoutAppColors.grey0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: SvgPicture.asset(
                          "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/dot_icon.svg",
                        ),
                      ),
                      Text(
                        "${category.totalMinutes} Min",
                        style: const TextStyle(
                          color: WorkoutAppColors.grey0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SvgPicture.asset(
            "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/arrow_right_icon.svg",
          ),
        ],
      ),
    );
  }
}
