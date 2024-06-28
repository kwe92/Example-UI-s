import 'package:example_ui/examples/workoutApp/features/auth/signIn/email/sign_in_email_view_model.dart';
import 'package:example_ui/examples/workoutApp/features/auth/signIn/password/sign_in_password_view.dart';
import 'package:example_ui/examples/workoutApp/features/auth/signIn/shared/horizontal_separator.dart';
import 'package:example_ui/examples/workoutApp/features/auth/signIn/shared/social_media_icons.dart';
import 'package:example_ui/examples/workoutApp/features/auth/signUp/sign_up_view.dart';
import 'package:example_ui/examples/workoutApp/features/services/string_service.dart';
import 'package:example_ui/examples/workoutApp/features/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInEmailView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  SignInEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ChangeNotifierProvider(
            create: (_) => SignInEmailViewModel(),
            builder: (context, _) {
              final viewModel = context.watch<SignInEmailViewModel>();
              return Column(
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
                    "Email Address",
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
                      onChanged: viewModel.setEmail,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: "Enter email address",
                      ),
                      validator: StringService.emailValidator,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.maxFinite,
                    height: 56,
                    child: CustomButton(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignInPasswordView(),
                            ),
                          );
                        }
                      },
                      label: "Continue",
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Color(0xff81809E)),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SignUpView(),
                          ),
                        ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
