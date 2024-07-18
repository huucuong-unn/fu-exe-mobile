import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';

import '../../../../core/theme/app_pallete.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppPallete.gradient1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            FAQ(
              question: "What is this app used for?",
              answer: 'For receiving news from mentors!',
              expandedIcon: Icon(Icons.minimize, color: Colors.blue),
              collapsedIcon: Icon(Icons.add, color: Colors.blue),
              showDivider: true,
              ansStyle: TextStyle(color: Colors.black87, fontSize: 15),
              ansPadding: EdgeInsets.all(10),
            ),
            SizedBox(height: 10),
            FAQ(
              question: "How to see your mentor?",
              answer: 'Choose the mentor list!',
              expandedIcon: Icon(Icons.minimize, color: Colors.blue),
              collapsedIcon: Icon(Icons.add, color: Colors.blue),
              showDivider: true,
              ansStyle: TextStyle(color: Colors.black87, fontSize: 15),
              ansPadding: EdgeInsets.all(10),
            ),
            SizedBox(height: 10),
            FAQ(
              question: "How to edit profile?",
              answer: 'Go to the edit profile section.',
              expandedIcon: Icon(Icons.minimize, color: Colors.blue),
              collapsedIcon: Icon(Icons.add, color: Colors.blue),
              showDivider: true,
              ansStyle: TextStyle(color: Colors.black87, fontSize: 15),
              ansPadding: EdgeInsets.all(10),
            ),
            SizedBox(height: 10),
            FAQ(
              question: "Need help?",
              answer: 'Call 911!',
              expandedIcon: Icon(Icons.minimize, color: Colors.blue),
              collapsedIcon: Icon(Icons.add, color: Colors.blue),
              showDivider: true,
              ansStyle: TextStyle(color: Colors.black87, fontSize: 15),
              ansPadding: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
