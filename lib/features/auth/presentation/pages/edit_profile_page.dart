import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tortee/controller/accountmentee_controller.dart';
import 'package:tortee/features/auth/presentation/pages/home_page.dart';
import 'package:tortee/features/auth/presentation/pages/login_page.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_field.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:tortee/features/auth/presentation/widgets/footer.dart';

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

  final AccountMenteeController accountMenteeController =
      Get.find<AccountMenteeController>();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() {
    final accountMentee = accountMenteeController.accountMentee;
    if (accountMentee != null) {
      nameController.text = accountMentee.name;
      emailController.text = accountMentee.email;
      studentCodeController.text = accountMentee.studentCode;
      universityController.text = accountMentee.university;
    }
  }

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
      MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
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
                  'My Profile',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                AuthField(
                  hintText: 'Name',
                  controller: nameController,
                  // Make the field read-only
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'Email',
                  controller: emailController,
                  // Make the field read-only
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'Student Code',
                  controller: studentCodeController,
                  // Make the field read-only
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'University',
                  controller: universityController,
                ),
                const SizedBox(height: 20),
                AuthGradientButton(
                  buttonText: 'Close',
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
