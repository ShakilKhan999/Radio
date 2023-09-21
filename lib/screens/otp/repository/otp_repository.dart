import 'package:relaks_media/models/otp_response.dart';
import 'package:http/http.dart' as http;

class OtpRepository {
  Future<OtpResponse> verifyOtp(
      {required String token,
      required String otp,}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://16.171.2.83/api/v1/verify_register/'));
    request.fields.addAll({
      'token':
          token,
      'code': otp
    });

    http.StreamedResponse response = await request.send();

    return otpResponseFromJson(await response.stream.bytesToString());
  }
}
