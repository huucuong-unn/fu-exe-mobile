import 'package:flutter/material.dart';
import 'package:tortee/features/auth/object/mentor.dart';
import 'package:tortee/features/auth/presentation/pages/mentor_detail_page.dart';

class MyRequestPage extends StatefulWidget {
  const MyRequestPage({super.key});

  @override
  State<MyRequestPage> createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage> {
  // Sample data for the requests
  final List<Mentor> mentors = [
    Mentor(
      name: 'Mentor 1',
      imageUrl:
          'https://tortee-image-upload.s3.ap-southeast-1.amazonaws.com/0b728316-ad82-4e7b-bad6-18fedd80251d-326743518_490780646548262_9186035695995813565_n.jpg',
      backgroundImageUrl:
          'https://via.placeholder.com/800x400', // Replace with your background image URL
      phoneNumber: '+1234567890',
      companyName: 'Example Company 1',
    ),
    Mentor(
      name: 'Mentor 2',
      imageUrl:
          'https://tortee-image-upload.s3.ap-southeast-1.amazonaws.com/0b728316-ad82-4e7b-bad6-18fedd80251d-326743518_490780646548262_9186035695995813565_n.jpg',
      backgroundImageUrl:
          'https://via.placeholder.com/800x400', // Replace with your background image URL
      phoneNumber: '+1234567890',
      companyName: 'Example Company 2',
    ),
    // Add more mentors here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Requests'),
      ),
      body: ListView.builder(
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          final mentor = mentors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(mentor.imageUrl!),
            ),
            title: Text(
              mentor.name!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${mentor.companyName} - ${mentor.phoneNumber}',
                    style: TextStyle(
                      color: Colors.black,
                    )),
                Text(
                  'Accepted',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              // Navigate to the details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MentorDetailPage(mentor: mentor),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
