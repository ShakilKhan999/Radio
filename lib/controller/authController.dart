
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:relaks_media/Repo/authServiece.dart';

import '../screens/bottomnevigation.dart';

class AuthController extends GetxController{
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future<void> LogIn() async {
    User? user = await AuthServiece().signInWithEmailAndPassword(mailController.text, passController.text);
    if (user != null) {
      print('User signed in: ${user.email}');
      Get.offAll(BottomNavigation());
    } else {
      print('Sign in failed.');
    }
  }

  Future<void> SignUp() async {
    User? user = await AuthServiece().registerWithEmailAndPassword(mailController.text, passController.text);
    if (user != null) {
      print('User registered: ${user.email}');
      Get.offAll(BottomNavigation());
    } else {
      print('Registration failed.');
      // Show an error message to the user
    }
  }
}
