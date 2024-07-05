import 'package:example_ui/examples/workoutApp/app/theme/workout_app_theme.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/ui/dashboard_view_model.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/ui/widgets/exercise_list_tile.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/ui/widgets/header_text_button.dart';
import 'package:example_ui/examples/workoutApp/features/dashboard/ui/widgets/progress_card.dart';
import 'package:example_ui/examples/workoutApp/features/shared/services/services.dart';
import 'package:example_ui/examples/workoutApp/features/shared/widgets/custom_button.dart';
import 'package:example_ui/examples/workoutApp/features/shared/widgets/loading_spinner.dart';
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
              return Stack(
                children: [
                  ListView(
                    children: [
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/banner_icon.svg",
                          ),
                          GestureDetector(
                            onTap: !viewModel.isBusy
                                ? () async {
                                    await viewModel.getNotifications();
                                    await toastService.notificationsModal(notifications: viewModel.notifications);
                                  }
                                : () {},
                            child: SvgPicture.asset(
                              "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/notification_bell_icon_active.svg",
                            ),
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
                              Color(0xff9747FF), // one off
                              Color(0xff6F00FF), // one off
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
                          itemCount: viewModel.workoutProgress.length,
                          itemBuilder: (context, index) => ProgressCard(
                            workoutProgress: viewModel.workoutProgress[index],
                          ),
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
                          viewModel.exerciseCategories.length,
                          (i) => Column(
                            children: [
                              ExerciseListTile(category: viewModel.exerciseCategories[i]),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (viewModel.isBusy) const LoadingSpinner()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
