import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tortee/core/theme/app_pallete.dart';
import 'package:tortee/features/auth/presentation/widgets/footer.dart';
import 'package:tortee/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> login() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    try {
      var url = Uri.parse(ApiEndpoint.baseUrl + ApiEndpoint.auth.login);
      Map body = {
        'emailOrUsername': emailController.text.trim(),
        'password': passwordController.text,
        'loginWithRole': "student"
      };
      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status'] == 'ACTIVE') {
          var token = json['token'];
          var id = json['id'];
          var studentId = json['studentId'];
          final SharedPreferences prefs = await _prefs;
          await prefs?.setString('token', token);
          await prefs?.setString('id', id);
          await prefs?.setString('studentId', studentId);

          emailController.clear();
          passwordController.clear();
          //go to home page
          Get.off(BottomNavigationBarExample());
        } else {
          Get.back();
          showDialog(
              context: Get.context!,
              builder: (context) {
                return SimpleDialog(
                  title: Text('Error'),
                  contentPadding: EdgeInsets.all(20),
                  children: [
                    Text('Error occurred while trying to login'),
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Close'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppPallete.gradient1,
                        ))
                  ],
                );
              });
        }
      } else {
        Get.back();
        showDialog(
            context: Get.context!,
            builder: (context) {
              return SimpleDialog(
                title: Text('Error'),
                backgroundColor: AppPallete.backgroundColor,
                contentPadding: EdgeInsets.all(20),
                children: [
                  Text('Email or password is incorrect'),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Close'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppPallete.gradient1,
                      ))
                ],
              );
            });
      }
    } catch (e) {
      print(e);
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text('An error occurred while trying to login'),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Close'),
                )
              ],
            );
          });
    }
  }
}
