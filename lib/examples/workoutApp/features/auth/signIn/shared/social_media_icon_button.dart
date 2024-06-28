import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;

  const SocialIconButton({
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          color: Color(0xff37373C),
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
