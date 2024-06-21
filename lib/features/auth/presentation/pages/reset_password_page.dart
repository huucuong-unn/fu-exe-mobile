import 'package:flutter/material.dart';
import 'package:tortee/core/theme/app_pallete.dart';
import 'package:tortee/features/auth/presentation/pages/home_page.dart';
import 'package:tortee/features/auth/presentation/pages/login_page.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_field.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_gradient_button.dart';

class ResetPasswordPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) {
        return const LoginPage();
      });
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPage();
}

class _ResetPasswordPage extends State<ResetPasswordPage> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _navigateToHomePage() {
    // Replace HomePage() with the component you want to navigate to
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Forgot password?',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Text(
                'We will send you a link to reset your password',
                style: TextStyle(fontSize: 16, color: AppPallete.greyColor),
              ),
              const SizedBox(height: 30),
              AuthField(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 20),
              AuthGradientButton(
                buttonText: 'Send reset link',
                onPressed: _navigateToHomePage,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
