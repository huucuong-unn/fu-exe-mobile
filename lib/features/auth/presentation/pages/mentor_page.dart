import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tortee/controller/mentor_controller.dart';
import 'package:tortee/features/auth/object/mentor.dart';
import 'package:tortee/utils/image_url_host.dart';
import 'mentor_detail_page.dart';

class MentorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MentorController controller = Get.find();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4 / 4,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: controller.mentors.length,
                        itemBuilder: (context, index) {
                          return MentorTile(mentor: controller.mentors[index]);
                        },
                      ),
                    ),
                  ],
                ),
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
                  ImageUrlHost.getImageUrl(mentor.profilePicture),
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
