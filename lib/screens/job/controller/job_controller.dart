import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/home_controller.dart';
import 'package:relaks_media/global/constants.dart';
import 'package:relaks_media/global/shared_preference_helper.dart';
import 'package:relaks_media/screens/job/repository/job_repository.dart';

class JobController extends GetxController {
  postJob(
      {required String name,
      required String email,
      required String phone,
      required String education,
      required String experience,
      required String skill,
      required String note,
      required String applyAs,
      required String officialEmail}) async {
    int? userId = await SharedPreferenceHelper().getInt(key: id);
    var response = await JobRepository().postJob(
        userId: userId!.toString(),
        name: name,
        email: email,
        phone: phone,
        education: education,
        experience: experience,
        skill: skill,
        note: note,
        applyAs: applyAs,
        officialEmail: officialEmail);
    if (response.success!) {
      Fluttertoast.showToast(
        msg: response.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      HomeController homeController = Get.find();
      homeController.homestate.value = 0;
    }
  }
}
