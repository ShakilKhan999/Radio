import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/login/repository/login_repository.dart';

import '../../../global/shared_preference_helper.dart';

class LoginController extends GetxController {
     var isLoginCompeleted = false.obs;

    void login({required String email, required String password}) async {
    isLoginCompeleted.value = false;
    try {
      EasyLoading.show();
      final response = await LoginRepository().login(email: email, password: password);
      if (response.success!) {
        // await SharedPreferenceHelper().saveMemberData(response);
        // await SharedPreferenceHelper().setLoginStatus(status: true);
        EasyLoading.dismiss();
        isLoginCompeleted.value = true;
        // Get.offAll(const BottomNavigation());
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