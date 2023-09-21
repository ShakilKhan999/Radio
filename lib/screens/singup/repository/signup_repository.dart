import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:relaks_media/models/signup_response.dart';

class SignUpRepository {
  Future<SignUpResponse> signup(
      {required String email,
      required String phone,
      required String password}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://16.171.2.83/api/v1/register/'));
    request.fields.addAll({
      'name': 'null',
      'email': email,
      'phone': phone,
      'password': password,
    });
    http.StreamedResponse response = await request.send();
    // log(await response.stream.bytesToString());
    var res = await response.stream.bytesToString();
    log(res.toString());
    return signUpResponseFromJson(res);
  }
}
