import 'package:flutter/material.dart';
import 'package:tortee/controller/mentor_controller.dart';
import 'package:tortee/features/auth/object/mentor.dart';
import 'package:get/get.dart';
import 'package:tortee/utils/image_url_host.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyMentorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MentorController controller = Get.put(MentorController());

    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.mentor == null) {
          return Text('No mentor data');
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.prod.website-files.com/61cb7a7d475583f9b7aeec64/649c58ac23fc8a24e4228360_Summer%20Campaigns%20we%20love.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(ImageUrlHost.getImageUrl(
                      controller.mentor!.profilePicture)),
                ),
                SizedBox(height: 10.0),
                Text(
                  controller.mentor!.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  controller.mentor!.email,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  controller.mentor!.companyName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.0),

                // Display the mentor's description
                Text(
                  controller.mentor!.description,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Add a SizedBox for spacing
                SizedBox(height: 20.0),

                // Display the mentor's Google Meet URL
                TextButton(
                  onPressed: () async {
                    String url = controller.mentor!.googleMeetUrl;
                    if (await canLaunchUrlString(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    controller.mentor!.googleMeetUrl,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue, // Make the text blue
                      decoration:
                          TextDecoration.underline, // Underline the text
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
