import 'package:example_ui/app/theme/colors.dart';
import 'package:example_ui/app/theme/workout_app_theme.dart';
import 'package:example_ui/features/shared/services/services.dart';
import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordModal extends StatelessWidget {
  const ForgotPasswordModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
        width: double.maxFinite,
        height: 250,
        decoration: const BoxDecoration(
          color: WorkoutAppColors.grey3,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Are you sure you want to reset your password?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              "an email will be sent to: " "${authService.tempUser.email}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Flexible(
                  child: CustomButton(
                    onTap: () => Navigator.pop(context, true),
                    label: "Yes",
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: CustomButton(
                    buttonTheme: secondaryButtonTheme,
                    onTap: () => Navigator.pop(context, false),
                    label: "No",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
