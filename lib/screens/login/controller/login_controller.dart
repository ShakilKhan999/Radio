import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/login/repository/login_repository.dart';

import '../../../global/shared_preference_helper.dart';
import '../../bottomnevigation.dart';

class LoginController extends GetxController {
     var isLoginCompeleted = false.obs;

    void login({required String email, required String password}) async {
    isLoginCompeleted.value = false;

      EasyLoading.show();
      final response = await LoginRepository().login(email: email, password: password);
      if (response.success!) {
        await SharedPreferenceHelper().saveMemberData(loginResponse: response);
        await SharedPreferenceHelper().setLoginStatus(status: true);
        EasyLoading.dismiss();
        isLoginCompeleted.value = true;
        Get.offAll(const BottomNavigation());
      } else {
        EasyLoading.dismiss();
        // showToast(toastText: response.messages![0]);
      }
    
  }
}