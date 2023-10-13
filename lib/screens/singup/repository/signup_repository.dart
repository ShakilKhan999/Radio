import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:relaks_media/models/signup_response.dart';

import '../../../global/constants.dart';

class SignUpRepository {
  Future<SignUpResponse> signup({
    required String email,
    required String phone,
    required String password,
    required String referralNumber,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}api/v1/register/'));
    request.fields.addAll({
      'name': 'null',
      'email': email,
      'phone': phone,
      'password': password,
      'referral_id': referralNumber,
    });
    http.StreamedResponse response = await request.send();
    // log(await response.stream.bytesToString());
    var res = await response.stream.bytesToString();
    log(res.toString());
    return signUpResponseFromJson(res);
  }
}
