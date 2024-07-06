import 'package:example_ui/features/auth/signIn/shared/social_media_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// TODO: use firebase for social login

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIconButton(
          onTap: () {},
          icon: SvgPicture.asset("/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/google_icon.svg"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SocialIconButton(
            onTap: () {},
            icon: SvgPicture.asset("/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/apple_icon.svg"),
          ),
        ),
        SocialIconButton(
          onTap: () {},
          icon: SvgPicture.asset("/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/facebook_icon.svg"),
        ),
      ],
    );
  }
}
