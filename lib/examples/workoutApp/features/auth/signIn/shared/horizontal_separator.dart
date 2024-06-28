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
              color: Color(0xff81809E),
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
        color: const Color(0xff323239),
      ),
    );
