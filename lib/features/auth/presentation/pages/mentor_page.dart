import 'package:flutter/material.dart';
import 'package:tortee/features/auth/object/mentor.dart';
import 'mentor_detail_page.dart';

class MentorPage extends StatelessWidget {
  final List<Mentor> mentors = [
    Mentor(
        name: 'Mentor 1',
        imageUrl:
            'https://tortee-image-upload.s3.ap-southeast-1.amazonaws.com/0b728316-ad82-4e7b-bad6-18fedd80251d-326743518_490780646548262_9186035695995813565_n.jpg',
        backgroundImageUrl:
            'https://via.placeholder.com/800x400', // Replace with your background image URL
        phoneNumber: '+1234567890',
        companyName: 'Example Company 1'),
    Mentor(
        name: 'Mentor 2',
        imageUrl:
            'https://tortee-image-upload.s3.ap-southeast-1.amazonaws.com/0b728316-ad82-4e7b-bad6-18fedd80251d-326743518_490780646548262_9186035695995813565_n.jpg',
        backgroundImageUrl:
            'https://via.placeholder.com/800x400', // Replace with your background image URL
        phoneNumber: '+1234567890',
        companyName: 'Example Company 2'),
    // Add more mentors here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 90.0, bottom: 18),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: 'Search Mentors',
            //       prefixIcon: Icon(Icons.search),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: mentors.length,
                itemBuilder: (context, index) {
                  return MentorTile(mentor: mentors[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MentorTile extends StatelessWidget {
  final Mentor mentor;

  const MentorTile({Key? key, required this.mentor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MentorDetailPage(mentor: mentor),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  mentor.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    mentor.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
