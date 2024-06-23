import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tortee/controller/accountmentee_controller.dart';
import 'package:tortee/core/theme/app_pallete.dart';
import 'package:tortee/features/auth/presentation/pages/edit_profile_page.dart';
import 'package:tortee/features/auth/presentation/pages/faq_page.dart';
import 'package:tortee/features/auth/presentation/pages/login_page.dart';
import 'package:tortee/features/auth/presentation/pages/mentor_page.dart';
import 'package:tortee/features/auth/presentation/pages/my_request_page.dart';
import 'package:tortee/features/auth/presentation/pages/news_page.dart';
import 'package:tortee/utils/image_url_host.dart';

class ProfilePage extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final AccountMenteeController accountMenteeController =
      Get.put(AccountMenteeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 90.0, bottom: 18),
            ),
            Obx(() {
              if (accountMenteeController.isLoading.value) {
                return CircularProgressIndicator();
              } else if (accountMenteeController.accountMentee != null) {
                return Column(
                  children: [
                    Text(
                      'Hi ${accountMenteeController.accountMentee!.name}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppPallete.gradient1,
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(
                      Icons.currency_exchange,
                    ),
                    Text(
                      '${accountMenteeController.accountMentee!.point} point(s)',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(ImageUrlHost.getImageUrl(
                          accountMenteeController.accountMentee!.imageUrl)),
                    ),
                  ],
                );
              } else {
                return Text(
                  'No data available',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              }
            }),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: const Text('Profile',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Navigate to Account settings
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.mail, color: Colors.black),
                    title: const Text('My Requests',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Navigate to Account settings
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyRequestPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.history, color: Colors.black),
                    title: const Text('History',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Navigate to History settings
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MentorPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.notifications, color: Colors.black),
                    title: const Text('Notifications',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // Navigate to Notifications settings
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help, color: Colors.black),
                    title: const Text('Help',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FaqPage(),
                        ),
                      );
                      // Navigate to Help section
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.black),
                    title: const Text('Logout',
                        style: TextStyle(color: Colors.black)),
                    onTap: () async {
                      // Handle logout
                      final SharedPreferences? prefs = await _prefs;
                      await prefs?.clear();
                      Get.offAll(LoginPage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
