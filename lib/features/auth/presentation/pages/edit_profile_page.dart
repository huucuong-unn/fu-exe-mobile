import 'package:flutter/material.dart';
import 'package:tortee/features/auth/presentation/pages/home_page.dart';
import 'package:tortee/features/auth/presentation/pages/login_page.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_field.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_gradient_button.dart';

class EditProfilePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) {
        return const LoginPage();
      });
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final emailController = TextEditingController();
  final studentCodeController = TextEditingController();
  final universityController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    studentCodeController.dispose();
    universityController.dispose();
    nameController.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                AuthField(hintText: 'Name', controller: nameController),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'Student Code',
                  controller: studentCodeController,
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'University',
                  controller: universityController,
                ),
                const SizedBox(height: 20),
                AuthGradientButton(
                  buttonText: 'Save',
                  onPressed: _navigateToHomePage,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
