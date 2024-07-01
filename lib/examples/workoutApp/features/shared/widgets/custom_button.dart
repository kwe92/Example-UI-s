import 'package:example_ui/examples/workoutApp/app/theme/workout_app_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final double? width;
  final double height;
  final OutlinedButtonThemeData? buttonTheme;
  final Color? color;
  const CustomButton({
    required this.onTap,
    required this.label,
    this.width = double.maxFinite,
    this.height = 56,
    this.buttonTheme,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onTap,
        style: color == null
            ? buttonTheme != null
                ? buttonTheme?.style
                : mainButtonTheme.style!
            : mainButtonTheme.style!.copyWith(backgroundColor: resolver(color)),
        child: Text(
          label,
        ),
      ),
    );
  }
}
