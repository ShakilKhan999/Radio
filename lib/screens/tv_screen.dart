import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:relaks_media/controller/radio_controller.dart';
import 'package:relaks_media/global/my_app_bar.dart';
import 'package:relaks_media/global/my_bottom_nav_bat.dart';

class TvScreen extends StatelessWidget {
  TvScreen({super.key});
  RadioController radioController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: myAppBar(context, radioController),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Container(
                    height: 22.h,
                    width: 53.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          'LIVE',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 150.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.play_circle_outline_sharp,
                      color: Colors.black,
                      size: 50,
                    )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Entertainment',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 150.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.play_circle_outline_sharp,
                      color: Colors.black,
                      size: 50,
                    )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Music',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 150.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.play_circle_outline_sharp,
                      color: Colors.black,
                      size: 50,
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: myBottomNavBar(radioController),
      ),
    );
  }
}
