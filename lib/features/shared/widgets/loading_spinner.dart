import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xff29292D),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 4,
            ),
          ],
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
