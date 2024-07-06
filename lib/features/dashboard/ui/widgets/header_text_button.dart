import 'package:flutter/material.dart';

class HeaderTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String header;
  final String buttonLabel;
  const HeaderTextButton({
    required this.onTap,
    required this.header,
    required this.buttonLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            buttonLabel,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
