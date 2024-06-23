import 'package:flutter/material.dart';
import 'package:tortee/features/auth/object/mentor.dart';
import 'package:tortee/utils/image_url_host.dart';

class MentorDetailPage extends StatelessWidget {
  final Mentor mentor;

  const MentorDetailPage({Key? key, required this.mentor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://cdn.prod.website-files.com/61cb7a7d475583f9b7aeec64/649c58ac23fc8a24e4228360_Summer%20Campaigns%20we%20love.png', // Replace with your image URL

                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      ImageUrlHost.getImageUrl(mentor.profilePicture)),
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
                  mentor.email,
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
        ],
      ),
    );
  }
}
