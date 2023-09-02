import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:relaks_media/models/signup_response.dart';

import '../../../global/constants.dart';

class SignUpRepository {
  Future<SignUpResponse> login(
      {required String email,
      required String phone,
      required String password}) async {
    // var headers = {
    //   'accept': 'text/plain',
    //   'Content-Type': 'application/json',
    // };
    var postBody = jsonEncode({
      'name': '',
      'email': email,
      'phone': phone,
      'password': password,
    });

    Uri uri = Uri.parse('$baseUrl/api/v1/register/');

    final response = await http.post(uri, body: postBody);
    return signUpResponseFromJson(response.body);
  }
}
