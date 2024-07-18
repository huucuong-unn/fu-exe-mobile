import 'package:flutter/material.dart';
import 'package:tortee/controller/mentor_controller.dart';
import 'package:tortee/features/auth/object/mentor.dart';
import 'package:get/get.dart';
import 'package:tortee/utils/image_url_host.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/theme/app_pallete.dart';

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
          return Scaffold(
            appBar: AppBar(
              title: Text('My Mentor'),
              backgroundColor: Colors.blue,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'No mentor data',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('My Mentor'),
            backgroundColor: AppPallete.gradient1,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.prod.website-files.com/61cb7a7d475583f9b7aeec64/649c58ac23fc8a24e4228360_Summer%20Campaigns%20we%20love.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(
                    ImageUrlHost.getImageUrl(controller.mentor!.profilePicture),
                  ),
                  backgroundColor: Colors.white,


                ),
                SizedBox(height: 15.0),
                Text(
                  controller.mentor!.name,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  controller.mentor!.email,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  controller.mentor!.companyName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    controller.mentor!.description,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30.0),
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
                    'Join Google Meet',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
