import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/Repo/authServiece.dart';
import 'package:relaks_media/controller/radio_controller.dart';
import 'package:relaks_media/global/constants.dart';
import 'package:relaks_media/global/shared_preference_helper.dart';
import 'package:relaks_media/screens/bottomnevigation.dart';
import 'package:relaks_media/screens/downlode_screen.dart';
import 'package:relaks_media/screens/fund_raising.dart';
import 'package:relaks_media/screens/fund_raising_screen%5D.dart';
import 'package:relaks_media/screens/job/view/career_screen.dart';
import 'package:relaks_media/screens/launcherpage.dart';
import 'package:relaks_media/screens/login/view/login_screen.dart';
import 'package:relaks_media/screens/news_screen.dart';
import 'package:relaks_media/screens/others_services_screen.dart';

import '../controller/authController.dart';
import '../controller/home_controller.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Map<String, dynamic>? paymentIntent;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    HomeController homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: GlassBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    leading: const ImageIcon(
                      AssetImage('images/close.png'),
                      color: Colors.white,
                    )),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () {
                    // homeController.homestate.value = 0;
                    // Navigator.pop(context);
                    RadioController radioController = Get.find();
                    radioController.bottomNavigationSelectedIndex.value = 0;
                    Get.offAll(BottomNavigation(),
                        transition: Transition.noTransition);
                  },
                  leading: Image.asset(
                    'images/menu_top_image.png',
                    height: 50.h,
                    width: 30.w,
                  ),
                  title: Text(
                    'Relaks Radio',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () {
                    // homeController.homestate.value = 1;
                    // Navigator.pop(context);
                    RadioController radioController = Get.find();
                    radioController.bottomNavigationSelectedIndex.value = 1;
                    Get.offAll(BottomNavigation(),
                        transition: Transition.noTransition);
                    // Get.to(NewsScreen());
                  },
                  leading: ImageIcon(
                    AssetImage('images/news_icon.png'),
                    color: Colors.white,
                  ),
                  title: Text(
                    'News',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () {
                    // Navigator.pop(context);
                    RadioController radioController = Get.find();
                    radioController.bottomNavigationSelectedIndex.value = 2;
                    Get.offAll(BottomNavigation(),
                        transition: Transition.noTransition);
                  },
                  leading: ImageIcon(
                    AssetImage('images/chat_icon.png'),
                    color: Colors.white,
                  ),
                  title: Text(
                    'Chat',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () {
                    // Navigator.pop(context);
                    RadioController radioController = Get.find();
                    radioController.bottomNavigationSelectedIndex.value = 3;
                    Get.offAll(BottomNavigation(),
                        transition: Transition.noTransition);
                  },
                  leading: ImageIcon(
                    AssetImage('images/store_icon.png'),
                    color: Colors.white,
                  ),
                  title: Text(
                    'My Store',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () {
                    // homeController.homestate.value = 4;
                    // Navigator.pop(context);
                    Get.offAll(FundRaisingScreen(),
                        transition: Transition.noTransition);
                  },
                  leading: ImageIcon(
                    AssetImage('images/fund-raising_icon.png'),
                    color: Colors.white,
                  ),
                  title: Text(
                    'Fund Raising',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () async {
                    bool? isLogedin =
                        await SharedPreferenceHelper().getBool(key: isLogin);
                    if (isLogedin!) {
                      Get.offAll(CareerScreen(),
                          transition: Transition.noTransition);
                    } else {
                      Get.to(LauncherPage());
                    }

                    // homeController.homestate.value = 5;
                    // Navigator.pop(context);
                  },
                  leading: ImageIcon(
                    AssetImage('images/careers_icons.png'),
                    color: Colors.white,
                  ),
                  title: Text(
                    'Career',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () {
                    // homeController.homestate.value = 6;
                    // Navigator.pop(context);
                    Get.offAll(OtherServicesScreen(),
                        transition: Transition.noTransition);
                  },
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text(
                    'Other Service',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () {
                    // homeController.homestate.value = 7;
                    // Navigator.pop(context);
                    Get.offAll(DownloadScreen(),
                        transition: Transition.noTransition);
                  },
                  leading: ImageIcon(
                    AssetImage('images/downloaded_icons.png'),
                    color: Colors.white,
                  ),
                  title: Text(
                    'Download',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () {
                    // homeController.homestate.value = 0;
                    // Navigator.pop(context);
                    RadioController radioController = Get.find();
                    radioController.bottomNavigationSelectedIndex.value = 0;
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.info_rounded, color: Colors.white),
                  title: Text(
                    'Relaks Radio',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                ListTile(
                  minLeadingWidth: 0,
                  onTap: () {
                    SharedPreferenceHelper()
                        .updateBool(key: isLogin, value: false);
                    Get.offAll(LauncherPage());
                  },
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                // Add more list items as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlassBox extends StatelessWidget {
  final Widget child;

  const GlassBox({Key? key, required this.child, double radius = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: child,
        ),
      ),
    );
  }
}
