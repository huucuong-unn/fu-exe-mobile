import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tortee/features/auth/object/account_mentee.dart';
import 'package:http/http.dart' as http;
import 'package:tortee/utils/api_endpoint.dart';

class AccountMenteeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var isLoading = false.obs;
  AccountMentee? accountMentee;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchData();
  }

  fetchData() async {
    final SharedPreferences prefs = await _prefs;
    var accountId = prefs.getString("id");

    if (accountId == null) {
      print("No account ID found in shared preferences.");
      isLoading(false);
      return;
    }

    try {
      isLoading(true);
      var url = Uri.parse(
          ApiEndpoint.baseUrl + ApiEndpoint.accountMentee.getOne + accountId);
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        accountMentee = AccountMentee.fromJson(result['mentee']);
        print("Fetched account mentee: ${accountMentee!.name}");
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
