import 'package:flutter/material.dart';
import 'package:tortee/core/theme/app_pallete.dart';
import 'package:tortee/features/auth/presentation/pages/edit_profile_page.dart';
import 'package:tortee/features/auth/presentation/pages/faq_page.dart';
import 'package:tortee/features/auth/presentation/pages/my_mentor_page.dart';
import 'package:tortee/features/auth/presentation/pages/my_request_page.dart';
import 'package:tortee/features/auth/presentation/pages/news_page.dart';
import 'package:tortee/features/auth/presentation/pages/notification_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom:
                      60), // Add padding to avoid content being hidden behind the footer
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top picture
                  Image.network(
                    'https://cdn.prod.website-files.com/61cb7a7d475583f9b7aeec64/649c58ac23fc8a24e4228360_Summer%20Campaigns%20we%20love.png', // Replace with your image URL
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),

                  // Name
                  const Text(
                    'SUMMER IS COMING 2024',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Campaign name
                  const Text(
                    'By Tortee',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  // Menu with 2 items in 1 row
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        _buildMenuItem(
                          icon: Icons.person,
                          label: 'Your Mentor',
                          onTap: () {
                            // Navigate to Account settings
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyMentorPage(),
                              ),
                            );
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.edit,
                          label: 'View Your Profile',
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
                        _buildMenuItem(
                          icon: Icons.notifications,
                          label: 'Notifications',
                          onTap: () {
                            // Navigate to Account settings
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsPage(),
                              ),
                            );
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.mail,
                          label: 'My Requests',
                          onTap: () {
                            // Navigate to Account settings
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyRequestPage(),
                              ),
                            );
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.help,
                          label: 'Faqs',
                          onTap: () {
                            // Navigate to Account settings
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FaqPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPallete.gradient1,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
