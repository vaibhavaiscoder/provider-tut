import 'dart:convert';

import 'package:provider_tut/customWidgets/flash_toast.dart';
import 'package:provider_tut/models/user_model.dart';
import 'package:provider_tut/repository/api.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future getUserData() async {
    final UserData data;
    var url = Uri.parse('${ApiConstants.baseUrl}/api/users');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    data = UserData.fromJson(decodedData);
    return data;
  }

   static Future<void> createUser(String name, String job) async {
    var url = Uri.parse('${ApiConstants.baseUrl}/api/users');
    final response =
        await http.post(url, body: json.encode({'name': name, 'job': job}));
    if (response.statusCode == 201) {
      CustomToast.showToastMessage(message: 'User created successfully');
    } else {
      CustomToast.showToastMessage(message: 'Failed to create user');
    }
  }
}
