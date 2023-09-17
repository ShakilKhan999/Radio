import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/singup/repository/signup_repository.dart';

import '../../../global/shared_preference_helper.dart';
import '../../bottomnevigation.dart';

class SignUpController extends GetxController {

   var isSignupCompeleted = false.obs;

    void signUp({required String email, required String phone, required String password}) async {
    isSignupCompeleted.value = false;
    try {
      EasyLoading.show();
      final response = await SignUpRepository()
          .signup(email: email, phone: phone, password: password);
      if (response.success!) {
        await SharedPreferenceHelper().saveMemberData(response);
        await SharedPreferenceHelper().setLoginStatus(status: true);
        EasyLoading.dismiss();
        isSignupCompeleted.value = true;
        Get.offAll(const BottomNavigation());
      } else {
        EasyLoading.dismiss();
        // showToast(toastText: response.messages![0]);
      }
    } catch (e) {
      EasyLoading.dismiss();
      // showToast(toastText: 'Invalid Pin');
    }
  }


}