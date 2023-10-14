import 'dart:developer';

import 'package:relaks_media/global/constants.dart';
import 'package:relaks_media/global/shared_preference_helper.dart';

import '../../../models/job_response.dart';
import 'package:http/http.dart' as http;

class JobRepository {
  Future<JobResponse> postJob(
    {
      required String userId,
      required String name,
      required String email,
      required String phone,
      required String education,
      required String experience,
      required String skill,
      required String note,
      required String applyAs,
      required String officialEmail

    }
  ) async {
    String? accessToken = await SharedPreferenceHelper().getString(key: token);
    var headers = {
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://16.171.2.83/api/v1/users/career/create/'));
    request.fields.addAll({
      'user': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'education': education,
      'experience': experience,
      'skill': skill,
      'note': note,
      'apply_as': applyAs,
      'official_email': officialEmail,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var res = await response.stream.bytesToString();

    log(res.toString());
    return jobResponseFromJson(res);
  }
}
