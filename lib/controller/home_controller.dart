import 'package:get/get.dart';

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
}