import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tortee/controller/login_controller.dart';
import 'package:tortee/core/theme/app_pallete.dart';
import 'package:tortee/features/auth/presentation/pages/reset_password_page.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_field.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:tortee/features/auth/presentation/widgets/footer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _navigateToHomePage() {
    // Replace HomePage() with the component you want to navigate to
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.blackColor),
              ),
              const SizedBox(height: 30),
              AuthField(
                hintText: 'Email',
                controller: loginController.emailController,
              ),
              const SizedBox(height: 15),
              AuthField(
                hintText: 'Password',
                controller: loginController.passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20),
              AuthGradientButton(
                buttonText: 'Sign In',
                onPressed: () => loginController.login(),
                // _navigateToHomePage, // Provide the navigation callback here
              ),
              const SizedBox(height: 10),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SignUpPage()));
              //   },
              //   child: RichText(
              //       text: TextSpan(
              //           text: 'Don\'t have an account? ',
              //           style: Theme.of(context).textTheme.titleMedium,
              //           children: [
              //         TextSpan(
              //             text: 'Sign Up',
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .titleMedium
              //                 ?.copyWith(
              //                     color: AppPallete.gradient2,
              //                     fontWeight: FontWeight.bold)),
              //       ])),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPasswordPage()));
                },
                child: RichText(
                    text: TextSpan(
                        text: '',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                          text: 'Forgot your password?',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold))
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
