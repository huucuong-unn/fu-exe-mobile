import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tortee/controller/mentor_controller.dart';
import 'package:tortee/features/auth/object/mentor.dart';
import 'package:tortee/features/auth/presentation/pages/mentor_detail_page.dart';
import 'package:tortee/utils/image_url_host.dart';

import '../../../../core/theme/app_pallete.dart';

class MyRequestPage extends StatefulWidget {
  const MyRequestPage({super.key});

  @override
  State<MyRequestPage> createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage> {
  final MentorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Requests'),
        backgroundColor: AppPallete.gradient1,
      ),
      body: Obx(
            () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.mentors.length,
          itemBuilder: (context, index) {
            final mentor = controller.mentors[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      ImageUrlHost.getImageUrl(mentor.profilePicture!),
                    ),
                  ),
                  title: Text(
                    mentor.name!,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.0),
                      Text(
                        mentor.companyName!,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        mentor.email!,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Accepted',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to the details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MentorDetailPage(mentor: mentor),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
