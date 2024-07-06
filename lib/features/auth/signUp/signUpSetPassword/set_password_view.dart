import 'package:example_ui/app/theme/colors.dart';
import 'package:example_ui/features/auth/signIn/email/sign_in_email_view.dart';
import 'package:example_ui/features/auth/signIn/shared/horizontal_separator.dart';
import 'package:example_ui/features/auth/signIn/shared/social_media_icons.dart';
import 'package:example_ui/features/auth/signUp/signUpSetPassword/set_password_view_model.dart';
import 'package:example_ui/features/navigator/navigator_view.dart';
import 'package:example_ui/features/shared/services/string_service.dart';
import 'package:example_ui/features/shared/services/services.dart';
import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:example_ui/features/shared/widgets/loading_spinner.dart';
import 'package:example_ui/features/shared/widgets/visibility_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetPasswordView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final passswordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();

  SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ChangeNotifierProvider(
            create: (_) => SetPasswordViewModel(),
            builder: (context, _) {
              final viewModel = context.watch<SetPasswordViewModel>();
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      const Center(
                        child: Text(
                          "Set Password",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              obscureText: viewModel.isObscured,
                              controller: passswordController,
                              onChanged: viewModel.setPassword,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                hintText: "Password",
                                suffixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
                                suffixIcon: VisibilityWidget(
                                  onTap: () => viewModel.setObscure(!viewModel.isObscured),
                                  isObscured: viewModel.isObscured,
                                ),
                              ),
                              validator: StringService.passwordValidator,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Confirm Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              obscureText: viewModel.isObscured,
                              controller: confirmedPasswordController,
                              onChanged: viewModel.setConfirmedPassword,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                hintText: "Confirm password",
                                suffixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
                                suffixIcon: VisibilityWidget(
                                  onTap: () => viewModel.setObscure(!viewModel.isObscured),
                                  isObscured: viewModel.isObscured,
                                ),
                              ),
                              validator: StringService.passwordValidator,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.maxFinite,
                        height: 56,
                        child: CustomButton(
                          backgroundColor: !viewModel.isBusy ? null : WorkoutAppColors.grey1,
                          onTap: !viewModel.isBusy
                              ? () async {
                                  if (formKey.currentState?.validate() ?? false) {
                                    if (!viewModel.isMatchingPassword) {
                                      toastService.showSnackBar("Passwords must match");
                                      return;
                                    }
                                    viewModel.setTempUser();

                                    await viewModel.createUser();

                                    if (viewModel.successfulLogin) {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const NavigatorView(),
                                        ),
                                      );
                                    }
                                  }
                                }
                              : () {},
                          label: "Continue",
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: WorkoutAppColors.grey0),
                          ),
                          TextButton(
                            onPressed: () async => await Navigator.pushAndRemoveUntil(
                                context, MaterialPageRoute(builder: (_) => SignInEmailView()), (_) => false),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const HorizontalSeparator(),
                      const SizedBox(height: 32),
                      const SocialMediaIcons(),
                    ],
                  ),
                  if (viewModel.isBusy) const LoadingSpinner()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
