import 'dart:convert';

import 'package:relaks_media/models/login_response.dart';
import 'package:http/http.dart' as http;
import '../../../global/constants.dart';

class LoginRepository {
  Future<LoginResponse> login(
    {required String email, required String password}) async {
  var postBody = jsonEncode({'username': email, 'password': password});

  Uri uri = Uri.parse('$baseUrl/api/v1/login/');

  final response = await http.post(uri, body: postBody);
  return loginResponseFromJson(response.body);
}
}


