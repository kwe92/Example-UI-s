import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          child: Column(
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/banner_icon.svg",
                  ),
                  SvgPicture.asset(
                    "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/notification_bell_icon.svg",
                  ),
                ],
              ),
              const SizedBox(height: 24),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Column(
                      children: [
                        SizedBox(
                          width: 190,
                          height: 78,
                          child: Text(
                            "Start Strong and Set Your Fitness Goals",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 126,
                      height: 136,
                      child: Image.asset(
                        "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/sample_person.png",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
