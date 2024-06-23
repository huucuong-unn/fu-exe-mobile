import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tortee/features/auth/object/account_mentee.dart';
import 'package:http/http.dart' as http;
import 'package:tortee/features/auth/object/mentor.dart';
import 'package:tortee/utils/api_endpoint.dart';

class MentorController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var isLoading = false.obs;
  Mentor? mentor;

  RxList<Mentor> mentors = <Mentor>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchData();
    await fetchAllMentors();
  }

  fetchData() async {
    final SharedPreferences prefs = await _prefs;
    var studentId = prefs.getString("studentId");

    if (studentId == null) {
      print("No student ID found in shared preferences.");
      isLoading(false);
      return;
    }

    try {
      isLoading(true);
      var url = Uri.parse(
          ApiEndpoint.baseUrl + ApiEndpoint.mentor.getMyMentorNow + studentId);
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        // Check if the result is not empty
        if (result != null && result.isNotEmpty) {
          // Parse the first mentor from the result
          mentor = Mentor.fromJson(result[0]['mentorProfile']);
          print("Fetched my mentor: ${mentor!.name}");
        } else {
          print("No mentors found.");
        }
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }

  fetchAllMentors() async {
    final SharedPreferences prefs = await _prefs;
    var studentId = prefs.getString("studentId");

    if (studentId == null) {
      print("No student ID found in shared preferences.");
      isLoading(false);
      return;
    }

    try {
      isLoading(true);
      var url = Uri.parse(
          ApiEndpoint.baseUrl + ApiEndpoint.mentor.getMyMentorNow + studentId);
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        for (var mentor in result) {
          mentors.add(Mentor.fromJson(mentor['mentorProfile']));
        }
        print("Fetched all mentors");
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }
}
