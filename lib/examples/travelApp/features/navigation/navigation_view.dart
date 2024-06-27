import 'package:example_ui/examples/travelApp/features/home/destination_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const DestinationSelectionView(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:
                  SvgPicture.asset("/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/travelApp/assets/home_icon.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/travelApp/assets/clock_menu_icon.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/travelApp/assets/heart_menu_icon.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon:
                  SvgPicture.asset("/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/travelApp/assets/user_icon.svg"),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
