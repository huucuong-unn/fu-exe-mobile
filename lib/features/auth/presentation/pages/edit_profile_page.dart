import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tortee/controller/accountmentee_controller.dart';
import 'package:tortee/features/auth/presentation/pages/home_page.dart';
import 'package:tortee/features/auth/presentation/pages/login_page.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_field.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_gradient_button.dart';

import '../../../../core/theme/app_pallete.dart';

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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: AppPallete.gradient1, // Customize app bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'My Profile',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                AuthField(
                  hintText: 'Name',
                  controller: nameController,

                ),
                SizedBox(height: 15),
                AuthField(
                  hintText: 'Email',
                  controller: emailController,

                ),
                SizedBox(height: 15),
                AuthField(
                  hintText: 'Student Code',
                  controller: studentCodeController,

                ),
                SizedBox(height: 15),
                AuthField(
                  hintText: 'University',
                  controller: universityController,
                ),
                SizedBox(height: 30),
                AuthGradientButton(
                  buttonText: 'Save Changes',
                  onPressed: () {
                    // Implement save changes logic here
                    _navigateToHomePage();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
