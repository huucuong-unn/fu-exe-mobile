import 'package:flutter/material.dart';
import 'package:tortee/core/theme/app_pallete.dart';

class WhiteButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const WhiteButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppPallete.whiteColor,
            AppPallete.whiteColor,
            AppPallete.whiteColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: AppPallete.transparentColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppPallete.gradient1,
          ),
        ),
      ),
    );
  }
}
