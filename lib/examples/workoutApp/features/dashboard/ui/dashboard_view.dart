import 'dart:math';

import 'package:example_ui/examples/workoutApp/app/theme/colors.dart';
import 'package:example_ui/examples/workoutApp/app/theme/workout_app_theme.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/examples/workoutApp/features/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: ChangeNotifierProvider(
            create: (context) => DashboardViewModel(),
            builder: (context, _) {
              final viewModel = context.watch<DashboardViewModel>();
              return ListView(
                children: [
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/banner_icon.svg",
                      ),
                      SvgPicture.asset(
                        "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/notification_bell_icon.svg",
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.maxFinite,
                    height: 176,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff9747FF),
                          Color(0xff6F00FF),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 200,
                                height: 78,
                                child: Text(
                                  "Start Strong and Set Your Fitness Goals",
                                  style: TextStyle(
                                    letterSpacing: 0,
                                    wordSpacing: 0,
                                    height: 1.1,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              CustomButton(
                                buttonTheme: secondaryButtonTheme,
                                width: 126,
                                height: 42,
                                onTap: () {},
                                label: "Start Exercise",
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 190,
                          top: 40,
                          child: SizedBox(
                            width: 126,
                            height: 136,
                            child: Image.asset(
                              "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/sample_person.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  HeaderTextButton(
                    onTap: () {},
                    header: "Progress",
                    buttonLabel: "See All",
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 152,
                    child: ListView.separated(
                      // shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => const ProgressCard(),
                      separatorBuilder: (context, index) => const SizedBox(width: 16),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  HeaderTextButton(
                    onTap: () {},
                    header: "Categories",
                    buttonLabel: "See All",
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.categories.length,
                      itemBuilder: (context, index) {
                        return CustomButton(
                          width: null,
                          height: 36,
                          buttonTheme: viewModel.selectedCategory == index ? categoryButtonTheme : deactiveCategoryButtonTheme,
                          onTap: () {
                            viewModel.setSelectedCategory(index);
                          },
                          label: viewModel.categories[index],
                        );
                      },
                      separatorBuilder: (context, _) => const SizedBox(
                        width: 8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: List.generate(
                      10,
                      (_) => const Column(
                        children: [
                          ExerciseListTile(),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// TODO: Add Workout Class to ProgressCard

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

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
                          child: const CircularProgressIndicator(
                            value: 0.5,
                            strokeWidth: 5,
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "6/12",
                        style: TextStyle(
                          color: WorkoutAppColors.mainThemeColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Chest Workout",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              const Text(
                "15 mins remaining",
                style: TextStyle(
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

class HeaderTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String header;
  final String buttonLabel;
  const HeaderTextButton({
    required this.onTap,
    required this.header,
    required this.buttonLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            buttonLabel,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

// TODO: Create an exercise class yo use instead of hard coded values

class ExerciseListTile extends StatelessWidget {
  const ExerciseListTile({super.key});

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
        color: Color(0xff202023), //TODO: check if the color 202023 is used elsewhere
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/warm_up_icon.png"),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Full Body Warm Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "20 Exercises",
                        style: TextStyle(
                          color: Color(0xff81809E),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: SvgPicture.asset(
                          "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/dot_icon.svg",
                        ),
                      ),
                      const Text(
                        "22 Min",
                        style: TextStyle(
                          color: Color(0xff81809E),
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
