import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_pallete.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // Get the instance of NewsController
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All News'),
        backgroundColor: AppPallete.gradient1,
      ),
      body: Obx(() {
        if (newsController.isLoading.value)
          return Center(child: CircularProgressIndicator());

        return ListView.builder(
          itemCount: newsController.news.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(15.0),
                    //   child: Image.network(
                    //     newsController.news[index].imageUrl,
                    //     height: 200,
                    //     width: double.infinity,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    SizedBox(height: 10),
                    Text(
                      newsController.news[index].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      newsController.news[index].body,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'By ${newsController.news[index].author}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          '${newsController.news[index].date}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class NewsController extends GetxController {
  var news = <News>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    var newsResult = [
      News(
        title: 'Campaign Launch Success',
        body: 'The recent campaign launch has been a great success...',
        imageUrl: 'https://media.sproutsocial.com/uploads/2023/03/Social-media-campaigns-V1-01-1.svg',
        author: 'John Doe',
        date: '2024-07-18',
      ),
      News(
        title: 'Student Achieves Top Marks',
        body: 'A student from our university has achieved top marks...',
        imageUrl: 'https://media.sproutsocial.com/uploads/2023/03/Social-media-campaigns-V1-01-1.svg',
        author: 'Jane Smith',
        date: '2024-07-18',
      ),
      // Add more fake news items as needed
    ];
    news.value = newsResult;
    isLoading.value = false;
  }
}

class News {
  final String title;
  final String body;
  final String imageUrl;
  final String author;
  final String date;

  News({
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.author,
    required this.date,
  });
}
