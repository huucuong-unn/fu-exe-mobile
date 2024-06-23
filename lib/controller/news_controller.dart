import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tortee/features/auth/object/notification_data.dart';

class NewsController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var isLoading = false.obs;

  RxList<NotificationData> news = <NotificationData>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);

      // Fake news data
      var result = [
        NotificationData(title: 'News 1', body: 'This is the body of news 1'),
        NotificationData(title: 'News 2', body: 'This is the body of news 2'),
      ];

      // Parse the news data from the result
      for (var item in result) {
        news.add(item);
      }
      print("Fetched news data");
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }
}
