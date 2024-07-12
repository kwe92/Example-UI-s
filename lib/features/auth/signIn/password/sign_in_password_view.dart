import 'package:example_ui/app/theme/colors.dart';
import 'package:example_ui/features/auth/signIn/password/sign_in_password_view_model.dart';
import 'package:example_ui/features/auth/signIn/shared/horizontal_separator.dart';
import 'package:example_ui/features/auth/signIn/shared/social_media_icons.dart';
import 'package:example_ui/features/auth/signUp/sign_up_view.dart';
import 'package:example_ui/features/navigator/navigator_view.dart';
import 'package:example_ui/features/shared/services/string_service.dart';
import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:example_ui/features/shared/widgets/loading_spinner.dart';
import 'package:example_ui/features/shared/widgets/visibility_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// TODO: combine like widgets from SignInEmailView

class SignInPasswordView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  SignInPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignInPasswordViewModel>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: emailController,
                      onChanged: viewModel.setPassword,
                      obscureText: viewModel.isObscured,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        suffixIcon: VisibilityWidget(
                          onTap: () => viewModel.setObscure(!viewModel.isObscured),
                          isObscured: viewModel.isObscured,
                        ),
                        suffixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
                      ),
                      validator: StringService.passwordValidator,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () async => await viewModel.resetpassword(),
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
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
                                viewModel.setTempUser();

                                await viewModel.signInWithEmailAndPassword();

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
                      label: "Sign in",
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: WorkoutAppColors.grey0),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignUpView()));
                        },
                        child: const Text(
                          "Create Account",
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
              if (viewModel.isBusy) const LoadingSpinner(),
            ],
          ),
        ),
      ),
    );
  }
}
