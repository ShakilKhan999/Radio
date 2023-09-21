import 'dart:convert';

import 'package:relaks_media/global/constants.dart';

import 'package:http/http.dart' as http;
import 'package:relaks_media/screens/Chat/user_list_model.dart';

class ChatRepo{
  Future<UserListModel> fetchUsers() async {
    final headers = {
      'Authorization': 'Bearer e0e6b09f5a9b9734c44d039ea02d7630adee76d9'
    };

    final response = await http.get(
      Uri.parse('${baseUrl}api/v1/users/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final userModel = UserListModel.fromJson(jsonData);
      return userModel;
    } else {
      throw Exception('Failed to load user data: ${response.reasonPhrase}');
    }
  }
}