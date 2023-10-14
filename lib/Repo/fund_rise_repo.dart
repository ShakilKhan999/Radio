import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global/constants.dart';
import '../global/shared_preference_helper.dart';
import '../models/fund_riser_model.dart';

class FundRiseRepo{
  Future<List<FundraiserModel>> getFundraiserList() async {
    var headers = {
      'Authorization': 'Bearer e0e6b09f5a9b9734c44d039ea02d7630adee76d9',
    };
    var url = Uri.parse('http://16.171.2.83/api/v1/posting/fund_raising_list/');
    var request = http.Request('GET', url);
    request.headers.addAll(headers);

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = json.decode(await response.stream.bytesToString());
        return [FundraiserModel.fromJson(jsonData)];
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


  Future<void> createFundraiser(String userId, String amount, String paymentMethod, String paymentNumber, String category) async {
    print("callledaddfundraiser");
    String? userToken = await SharedPreferenceHelper().getString(key: token);
    var headers = {
      'Authorization': 'Bearer $userToken',
    };

    var url = Uri.parse('http://16.171.2.83/api/v1/posting/fund_raising/create/');
    var request = http.MultipartRequest('POST', url);

    request.headers.addAll(headers);

    // Add form fields to the request
    request.fields.addAll({
      'user': userId,
      'amount': amount,
      'payment_method': paymentMethod,
      'payment_number': paymentNumber,
      'category': category,
    });

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("fundraisesuccess234");
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('fundraiseError: $e');
    }
  }
}