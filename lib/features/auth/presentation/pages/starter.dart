import 'package:flutter/material.dart';
import 'package:tortee/core/theme/app_pallete.dart';
import 'package:tortee/features/auth/presentation/pages/login_page.dart';
import 'package:tortee/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:tortee/features/auth/presentation/widgets/white_button.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  void _navigateToPage() {
    // Replace HomePage() with the component you want to navigate to
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppPallete
            .gradient1, // Replace with the desired color from AppPallete
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(), // Pushes the image to the center
            Center(
              child: Image.asset(
                'lib/assets/img/logo.png', // Your local image path
                width: 150,
                height: 150,
              ),
            ),
            Text(
              'Tortee',
              style: TextStyle(
                color: AppPallete.whiteColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(), // Pushes the button to the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: WhiteButton(
                  buttonText: 'Get Started', onPressed: _navigateToPage),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
