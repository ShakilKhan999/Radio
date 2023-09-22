import 'dart:convert';
import 'dart:developer';

import 'package:relaks_media/models/login_response.dart';
import 'package:http/http.dart' as http;
import '../../../global/constants.dart';

class LoginRepository {
  Future<LoginResponse> login(
      {required String email, required String password}) async {
    // var postBody = json.encode({'username': email, 'password': password});

    // Uri uri = Uri.parse('${baseUrl}api/v1/login/');

    // final response = await http.post(uri, body: postBody);
    // log(response.body.toString());
    // return loginResponseFromJson(response.body);
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}api/v1/login/'));
    request.fields.addAll({'username': email, 'password': password});

    http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      log(res.toString());
      return loginResponseFromJson(res);
    // } 
  }
}
