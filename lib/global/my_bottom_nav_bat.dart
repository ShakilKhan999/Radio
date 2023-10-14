import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../controller/radio_controller.dart';
import '../screens/bottomnevigation.dart';

Theme myBottomNavBar(RadioController radioController) {
  return Theme(
    data: Theme.of(Get.context!).copyWith(
      canvasColor: Colors.transparent,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey,
              Colors.black
            ], // Replace with your desired gradient colors
          ),
        ),
        child: BottomNavigationBar(
          // backgroundColor: Colors.yellow,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: radioController.bottomNavigationSelectedIndex.value,
          onTap: (index) {
            radioController.bottomNavigationSelectedIndex.value = index;
            Get.offAll(BottomNavigation(), transition: Transition.noTransition);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/news.png')),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/msg.png')),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/store.png')),
              label: 'Store',
            ),
          ],
        ),
      ),
    ),
  );

  // return Padding(
  //   padding: EdgeInsets.all(8.sp),
  //   child: ClipRRect(
  //     borderRadius: BorderRadius.circular(15),
  //     child: Container(
  //       height: 80.h,
  //       child: CurvedNavigationBar(
  //         index: radioController.bottomNavigationSelectedIndex.value,
  //         height: 70.h,
  //         animationDuration: Duration(),
  //         color: Colors.grey,
  //         backgroundColor: Colors.black,
  //         onTap: (index) {
  //           radioController.bottomNavigationSelectedIndex.value = index;
  //           Get.offAll(BottomNavigation(), transition: Transition.noTransition);
  //         },
  //         items: const [
  //           Icon(
  //             Icons.home,
  //             color: Colors.white,
  //           ),
  //           ImageIcon(
  //             AssetImage('images/news.png'),
  //             color: Colors.white,
  //           ),
  //           ImageIcon(
  //             AssetImage('images/msg.png'),
  //             color: Colors.white,
  //           ),
  //           ImageIcon(
  //             AssetImage('images/store.png'),
  //             color: Colors.white,
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // );
}
