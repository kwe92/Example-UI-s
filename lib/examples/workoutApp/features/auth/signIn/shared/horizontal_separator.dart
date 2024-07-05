import 'package:example_ui/examples/workoutApp/app/theme/colors.dart';
import 'package:flutter/material.dart';

class HorizontalSeparator extends StatelessWidget {
  const HorizontalSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalLine(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Or",
            style: TextStyle(
              color: WorkoutAppColors.grey0,
            ),
          ),
        ),
        horizontalLine()
      ],
    );
  }
}

Widget horizontalLine() => Flexible(
      child: Container(
        height: 1,
        color: WorkoutAppColors.grey2,
      ),
    );
