import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/otp/repository/otp_repository.dart';
import '../../../global/shared_preference_helper.dart';
import '../../bottomnevigation.dart';

class OtpController extends GetxController {
  void verifyOtp({
    required String token,
    required String otp,
  }) async {
    EasyLoading.show();
    final response = await OtpRepository().verifyOtp(token: token, otp: otp);
    if (response.success!) {
       await SharedPreferenceHelper().saveMemberDataSignup(otpResponse: response);
        await SharedPreferenceHelper().setLoginStatus(status: true);
      Get.offAll(BottomNavigation());
    }

    EasyLoading.dismiss();
  }
}
