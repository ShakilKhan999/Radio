import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relaks_media/Repo/profile_repository.dart';

class ProfileController extends GetxController{


  updateProfile({required String name, required String file}) async {
    var response = await ProfileRepository().editProfile(name: name, file: file);
  }


}