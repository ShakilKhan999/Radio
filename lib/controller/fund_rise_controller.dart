import 'package:get/get.dart';
import 'package:relaks_media/Repo/fund_rise_repo.dart';

import '../global/constants.dart';
import '../global/shared_preference_helper.dart';

class FundRiseController extends GetxController{
  var fundriserList=[].obs;

  Future<void> getallfundriser() async{
    fundriserList.value=await FundRiseRepo().getFundraiserList();
    print("Fundrisers213213:"+fundriserList.length.toString());
  }

  Future<void> addfundraiser(String amount) async{
    int? userId = await SharedPreferenceHelper().getInt(key: id);
    await FundRiseRepo().createFundraiser(userId!.toString(), amount, 'BKash', '01000000000', '');
    getallfundriser();
  }
}