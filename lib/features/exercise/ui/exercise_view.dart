import "package:example_ui/app/theme/colors.dart";
import "package:example_ui/app/theme/workout_app_theme.dart";
import "package:example_ui/features/exercise/ui/exercise_view_model.dart";
import "package:example_ui/features/shared/widgets/custom_button.dart";
import "package:example_ui/features/shared/widgets/loading_spinner.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:provider/provider.dart";

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExerciseViewModel>();
    // final s = Stopwatch();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercise",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: !viewModel.isBusy
                ? () async {
                    await viewModel.getNotifications();
                    await viewModel.notificationsModal();
                  }
                : () {},
            child: SvgPicture.asset(
              "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/notification_bell_icon_active.svg",
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const Text(
                  "Full Body Warm Up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  "jumping Jacks",
                  style: TextStyle(
                    color: WorkoutAppColors.grey0,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 42),
                Container(
                  width: double.maxFinite,
                  height: 288,
                  margin: const EdgeInsets.symmetric(horizontal: 42),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: WorkoutAppColors.grey3,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Image.asset(
                      "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/warm_up_icon_2.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 42),
                const Text(
                  "02:22",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomButton(
                          buttonTheme: OutlinedButtonThemeData(style: borderButtonStyle),
                          onTap: () {},
                          label: "Restart",
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: CustomButton(
                          onTap: () {},
                          label: "Pause",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 42),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: WorkoutAppColors.grey0,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (viewModel.isBusy) const LoadingSpinner()
        ],
      ),
    );
  }
}
