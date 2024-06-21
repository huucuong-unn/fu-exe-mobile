import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          FAQ(
            question: "Question 1",
            answer: 'answer 1',
            expandedIcon: Icon(Icons.minimize),
            collapsedIcon: Icon(Icons.add),
            showDivider: false,
            ansStyle: TextStyle(color: Colors.blue, fontSize: 15),
            ansPadding: EdgeInsets.all(50),
          ),
          FAQ(
            question: "Question 2",
            answer: 'answer 2',
            expandedIcon: Icon(Icons.minimize),
            collapsedIcon: Icon(Icons.add),
            showDivider: false,
            ansStyle: TextStyle(color: Colors.blue, fontSize: 15),
            ansPadding: EdgeInsets.all(50),
          ),
        ]),
      ),
    );
  }
}
