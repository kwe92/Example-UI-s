import 'package:example_ui/examples/workoutApp/features/auth/signIn/shared/social_media_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIconButton(
          onTap: () {},
          icon: SvgPicture.asset(
              "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/google_icon.svg"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SocialIconButton(
            onTap: () {},
            icon: SvgPicture.asset(
                "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/apple_icon.svg"),
          ),
        ),
        SocialIconButton(
          onTap: () {},
          icon: SvgPicture.asset(
              "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/lib/examples/workoutApp/app/assets/facebook_icon.svg"),
        ),
      ],
    );
  }
}
