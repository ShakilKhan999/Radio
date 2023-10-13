import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  var bgImage = ''.obs;


      var refferalId2 = ''.obs;
  var totalCoin2 = 0.obs;
  getUserData() async {
    refferalId2.value = (await SharedPreferenceHelper().getString(key: referralNumber))!;
    totalCoin2.value = (await SharedPreferenceHelper().getInt(key: totalCoin))!;
  }



  Future<void> getImageUrl() async {
    print('call555855');
    var headers = {
      'Authorization': 'Bearer e0e6b09f5a9b9734c44d039ea02d7630adee76d9'
    };
    var uri = Uri.parse('http://16.171.2.83/api/v1/posting/get_background_image/');

    var request = http.Request('GET', uri);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final decodedData = await response.stream.bytesToString();
      final jsonData = json.decode(decodedData);

      if (jsonData['success'] == true) {
        final image = jsonData['results']['image'];
        bgImage.value=image.toString();
        print(image.toString());
      } else {
        throw Exception("Request was successful, but response did not contain the 'image' value.");
      }
    } else {
      throw Exception("Failed to fetch data: ${response.reasonPhrase}");
    }
  }
}