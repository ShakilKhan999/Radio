import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/radio_controller.dart';
import 'package:relaks_media/global/my_app_bar.dart';
import 'package:relaks_media/global/my_bottom_nav_bat.dart';

import '../controller/home_controller.dart';
import '../utils/main_drawer.dart';
import 'bottomnevigation.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    RadioController radioController = Get.put(RadioController());

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(BottomNavigation(), transition: Transition.noTransition);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: MainDrawer(),
        appBar: myAppBar(context, radioController),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60.w,
                      child: IconButton(
                        onPressed: () {
                          // homeController.downloadestate.value = 0;
                          Get.offAll(BottomNavigation(), transition: Transition.noTransition);
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    Text(
                      'Download',
                      style: TextStyle(color: Colors.white, fontSize: 30.sp,fontFamily: 'Poppins'),
                    ),
                    Container(width: 60.w,)
                  ],
                ),
                SizedBox(height: 15.h,),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: GlassBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 600.h,
                            width: MediaQuery.of(context).size.width - 80.w,
                            child: Column(
                              children: [
                                buildDownloadItem(
                                  imageName: 'images/kakababu.png',
                                  title: 'KakaBabu Kidnap',
                                  size: '5.3 MB',
                                  homeController: homeController,
                                ),
                                buildDownloadItem(
                                  imageName: 'images/kakababu.png',
                                  title: 'KakaBabu Kidnap',
                                  size: '5.3 MB',
                                  homeController: homeController,
                                ),
                                buildDownloadItem(
                                  imageName: 'images/kakababu.png',
                                  title: 'KakaBabu Kidnap',
                                  size: '5.3 MB',
                                  homeController: homeController,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: myBottomNavBar(radioController),
      ),
    );
  }

  Widget buildDownloadItem({
    required String imageName,
    required String title,
    required String size,
    required HomeController homeController,
  }) {
    return GestureDetector(
      onTap: () {

        homeController.busstate.value = 1;

        if (homeController.downloadestate.value == 100) {
          homeController.downloadestate.value = 0;
        } else {
          homeController.downloadestate.value += 10;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(imageName, height: 50.h, width: 50.w),
                SizedBox(width: 7.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 17.sp),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      size,
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),
                  ],
                ),
              ],
            ),
            Obx(() {
              if (homeController.downloadestate.value == 0) {
                return IconButton(
                  onPressed: () {
                    homeController.downloadestate.value = 1;
                  },
                  icon: Icon(Icons.download, color: Colors.white),
                );
              } else if (homeController.downloadestate.value == 100) {
                return IconButton(
                  onPressed: () {
                    homeController.downloadestate.value = 0;
                  },
                  icon: Icon(Icons.play_arrow, color: Colors.white),
                );
              } else {
                return IconButton(
                  onPressed: () {
                    homeController.downloadestate.value = 0;
                  },
                  icon: Icon(Icons.pause, color: Colors.white),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
