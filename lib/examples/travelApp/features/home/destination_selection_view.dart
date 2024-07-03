import 'package:example_ui/examples/travelApp/features/home/destination_selection_view_model.dart';
import 'package:example_ui/examples/travelApp/features/home/widgets/custom_search_bar.dart';
import 'package:example_ui/examples/travelApp/features/home/widgets/destination_card.dart';
import 'package:example_ui/examples/travelApp/features/home/widgets/menu_button.dart';
import 'package:example_ui/examples/travelApp/features/home/widgets/welcome_user_list_tile.dart';
import 'package:example_ui/examples/travelApp/features/shared/services/destination_service.dart';
import 'package:example_ui/examples/travelApp/features/splashScreen/ui/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DestinationSelectionView extends StatelessWidget {
  const DestinationSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: DestinationService().fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashView();
          }
          if (snapshot.hasData) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 32,
                  right: 24,
                ),
                child: ChangeNotifierProvider(
                    create: (context) => DestinationSelectionViewModel(),
                    builder: (context, child) {
                      final viewModel = context.watch<DestinationSelectionViewModel>();
                      return Column(
                        children: [
                          const WelcomeUserListTile(),
                          const SizedBox(height: 32),
                          const CustomSearchBar(),
                          const SizedBox(height: 32),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular places",
                                style: TextStyle(
                                  color: Color(0xff2F2F2F),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "View all",
                                style: TextStyle(
                                  color: Color(0xff888888),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MenuButton(
                                onTap: () {
                                  viewModel.setIndex(0);
                                },
                                label: "Popular",
                                isSelected: viewModel.selectedIndex == 0 ? true : false,
                              ),
                              MenuButton(
                                onTap: () {
                                  viewModel.setIndex(1);
                                },
                                label: "Nearby",
                                isSelected: viewModel.selectedIndex == 1 ? true : false,
                              ),
                              MenuButton(
                                onTap: () {
                                  viewModel.setIndex(2);
                                },
                                label: "Latest",
                                isSelected: viewModel.selectedIndex == 2 ? true : false,
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: 310,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.destinations.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: DestinationCard(destination: viewModel.destinations[i]),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              // TODO: Make dynamic instead of static
              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        SvgPicture.asset(
                          "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/travelApp/assets/home_icon.svg",
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFF4A4A),
                          ),
                        )
                      ],
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        SvgPicture.asset(
                            "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/travelApp/assets/clock_menu_icon.svg"),
                        const SizedBox(height: 8),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        SvgPicture.asset(
                            "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/travelApp/assets/heart_menu_icon.svg"),
                        const SizedBox(height: 8),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        SvgPicture.asset(
                            "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/travelApp/assets/user_icon.svg"),
                        const SizedBox(height: 8),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
                    ),
                    label: '',
                  ),
                ],
              ),
            );
          }

          return const Center(
            // TODO: could add error view
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
