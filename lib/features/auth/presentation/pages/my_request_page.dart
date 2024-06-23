import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tortee/controller/mentor_controller.dart';
import 'package:tortee/features/auth/object/mentor.dart';
import 'package:tortee/features/auth/presentation/pages/mentor_detail_page.dart';
import 'package:tortee/utils/image_url_host.dart';

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
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.mentors.length,
                itemBuilder: (context, index) {
                  final mentor = controller.mentors[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          ImageUrlHost.getImageUrl(mentor.profilePicture!)),
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
                        Text('${mentor.companyName} - ${mentor.email}',
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
                          builder: (context) =>
                              MentorDetailPage(mentor: mentor),
                        ),
                      );
                    },
                  );
                },
              ),
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
