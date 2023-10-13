import 'package:get/get.dart';
import 'package:relaks_media/global/shared_preference_helper.dart';
import 'package:relaks_media/global/constants.dart';

class HomeController extends GetxController{
  var homestate=0.obs;
  var otherservicesubs=104.obs;
  var busstate=0.obs;
  var trainstate=0.obs;
  var airstate=0.obs;
  var eventstate=0.obs;
  var eventticketBookstate=0.obs;
  var mystorepagestate=0.obs;
  var paymentmethodstate=0.obs;
  var paymentmethodtypestate=0.obs;
  var downloadestate = 0.obs;
  var radioplaying=false.obs;
  var liveRadio = 0.obs;

  var newsCurrentPage = 0.obs;

  var currentIndex = 0.obs;

    var refferalId2 = ''.obs;
  var totalCoin2 = 0.obs;
  getUserData() async {
    refferalId2.value = (await SharedPreferenceHelper().getString(key: referralNumber))!;
    totalCoin2.value = (await SharedPreferenceHelper().getInt(key: totalCoin))!;
  }
}