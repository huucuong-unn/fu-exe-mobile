import 'package:flutter/material.dart';
import 'package:tortee/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppPallete.gradient1,
          AppPallete.gradient2,
          // AppPallete.gradient3,
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size(395, 55),
            backgroundColor: Colors.transparent,
            shadowColor: AppPallete.transparentColor,
          ),
          child: const Text('Sign Up',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
    );
  }
}
