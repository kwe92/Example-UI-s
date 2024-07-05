import 'package:example_ui/examples/workoutApp/app/theme/colors.dart';
import 'package:flutter/material.dart';

class VisibilityWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isObscured;
  final EdgeInsetsGeometry padding;
  final double size;
  final Color color;

  const VisibilityWidget({
    required this.onTap,
    required this.isObscured,
    this.padding = const EdgeInsets.only(right: 16.0),
    this.size = 24,
    this.color = WorkoutAppColors.grey0,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            size: size,
            !isObscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
          color: color,
        ),
      );
}
