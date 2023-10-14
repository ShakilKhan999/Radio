import 'dart:convert';

import 'package:relaks_media/global/constants.dart';

import 'package:http/http.dart' as http;
import 'package:relaks_media/screens/Chat/user_list_model.dart';

import '../../models/chat_model.dart';

class ChatRepo{

  Future<void> sendMessagetoApi(String senderId, String receiverId, String chat) async {
    var headers = {
      'Authorization': 'Bearer e0e6b09f5a9b9734c44d039ea02d7630adee76d9',
    };
    var url = Uri.parse('http://16.171.2.83/api/v1/chats/messages/create/');
    var request = http.MultipartRequest('POST', url);

    // Add form fields to the request
    request.fields.addAll({
      'sender': senderId,
      'receiver': receiverId,
      'chat': chat,
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  Future<Chatmodel?> fetchChatData(int chatId) async {
    final String baseUrl = 'http://16.171.2.83/api/v1/chats/messages/';
    final String token = 'e0e6b09f5a9b9734c44d039ea02d7630adee76d9';

    final Uri url = Uri.parse('$baseUrl$chatId');

    final headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(url, headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Chatmodel.fromJson(jsonResponse);
    } else {
      print('Failed to fetch chat data: ${response.reasonPhrase}');
      return null;
    }
  }
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