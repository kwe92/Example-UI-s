import 'package:example_ui/examples/workoutApp/features/auth/signIn/password/sign_in_password_view_model.dart';
import 'package:example_ui/examples/workoutApp/features/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
// TODO: combine like widgets from SignInEmailView

class SignInPasswordView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  SignInPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ChangeNotifierProvider(
            create: (_) => SignInPasswordViewModel(),
            builder: (context, _) {
              final viewModel = context.watch<SignInPasswordViewModel>();
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
                      // TODO: set obscureText in view model
                      // obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: SvgPicture.asset(
                            "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/password_visibility_icon.svg",
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
                      ),
                      validator:
                          // TODO: move validator to service
                          (value) {
                        if (value == null || value.isEmpty) {
                          return "Value can't be empty.";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.maxFinite,
                    height: 56,
                    child: CustomButton(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {}
                      },
                      label: "Sign in",
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
                        onPressed: () {},
                        child: const Text(
                          "Create Account",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
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
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIconButton(
                        onTap: () {},
                        icon: SvgPicture.asset(
                            "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/google_icon.svg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SocialIconButton(
                          onTap: () {},
                          icon: SvgPicture.asset(
                              "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/apple_icon.svg"),
                        ),
                      ),
                      SocialIconButton(
                        onTap: () {},
                        icon: SvgPicture.asset(
                            "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/facebook_icon.svg"),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget horizontalLine() => Flexible(
        child: Container(
          height: 1,
          color: const Color(0xff323239),
        ),
      );
}

class SocialIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;

  const SocialIconButton({
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          color: Color(0xff37373C),
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
