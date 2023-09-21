import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/otp/view/otp_screen.dart';
import 'package:relaks_media/screens/singup/repository/signup_repository.dart';

import '../../../global/shared_preference_helper.dart';
import '../../bottomnevigation.dart';

class SignUpController extends GetxController {
  var isSignupCompeleted = false.obs;

  void signUp(
      {required String email,
      required String phone,
      required String password}) async {
    isSignupCompeleted.value = false;

    EasyLoading.show();
    await SignUpRepository()
        .signup(email: email, phone: phone, password: password)
        .then((value) {
      EasyLoading.dismiss();
      isSignupCompeleted.value = true;
      Get.to(OtpScreen(
        from: 'signup',
        verificationToken: value.results!.verificationToken!,
      ));
    });
      EasyLoading.dismiss();
  }
}
