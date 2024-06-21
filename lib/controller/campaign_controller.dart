import 'dart:convert';

import 'package:get/get.dart';
import 'package:tortee/features/auth/object/campaign.dart';
import 'package:http/http.dart' as http;
import 'package:tortee/utils/api_endpoint.dart';

class CampaignController extends GetxController {
  var isLoading = false.obs;
  Campaign? campaign;
  fetchData() async {
    try {
      isLoading(true);
      var url = Uri.parse(ApiEndpoint.baseUrl + ApiEndpoint.campaign.getActive);
      http.Response response = await http.get(url);
      var result = jsonDecode(response.body);
      campaign = Campaign.fromJson(result['data']);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
