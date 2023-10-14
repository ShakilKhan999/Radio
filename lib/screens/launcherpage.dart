import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relaks_media/Repo/authServiece.dart';
import 'package:relaks_media/global/constants.dart';
import 'package:relaks_media/global/shared_preference_helper.dart';
import 'package:relaks_media/screens/splash_screen.dart';

import '../controller/home_controller.dart';
import '../controller/radio_controller.dart';
import 'bottomnevigation.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName='/';
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  void initState() {

    Future.delayed(Duration(milliseconds: 100)).then((value) => checklog());
    super.initState();
  }

  void checklog() async{
    bool? isLogedin = await SharedPreferenceHelper().getBool(key: isLogin);
    if(isLogedin!)
    {
      Get.offAll(BottomNavigation());
    }
    else
    {
      Get.off(SplashScreen());
    }
  }
  @override
  Widget build(BuildContext context) {
    RadioController radioController = Get.put(RadioController());
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Container(color: Colors.black,),
    );
  }
}
