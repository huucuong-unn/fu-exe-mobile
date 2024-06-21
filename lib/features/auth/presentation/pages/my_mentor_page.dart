import 'package:flutter/material.dart';
import 'package:tortee/features/auth/object/mentor.dart';

class MyMentorPage extends StatelessWidget {
  final Mentor mentor = Mentor(
    name: 'Mentor 1',
    imageUrl:
        'https://imagev3.vietnamplus.vn/w1000/Uploaded/2024/mzdic/2024_06_19/ronaldo-ky-luc-1906-4870.jpg.webp',
    backgroundImageUrl:
        'https://via.placeholder.com/800x400', // Replace with your background image URL
    phoneNumber: '+1234567890',
    companyName: 'Example Company 1',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(mentor.backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(mentor.imageUrl),
            ),
            SizedBox(height: 10.0),
            Text(
              mentor.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              mentor.phoneNumber,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              mentor.companyName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
