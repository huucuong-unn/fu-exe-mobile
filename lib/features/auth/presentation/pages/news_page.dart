import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tortee/controller/news_controller.dart';

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
      ),
      body: Obx(() {
        if (newsController.isLoading.value)
          return Center(child: CircularProgressIndicator());

        return ListView.builder(
          itemCount: newsController.news.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(newsController.news[index].title),
              subtitle: Text(newsController.news[index].body),
            );
          },
        );
      }),
    );
  }
}
