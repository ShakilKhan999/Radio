import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:relaks_media/controller/home_controller.dart';

import 'glass_box.dart';

class EarCoins extends StatelessWidget {
  const EarCoins({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Padding(
      padding: EdgeInsets.only(left: 40.0.sp, top: 180.h),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.sp),
            child: GlassBox(
              child: Container(
                height:MediaQuery.of(context).size.height-450.h,
                width: MediaQuery.of(context).size.width - 70.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.red,
                            height: 150.h,
                            child: Image.asset('images/earncoins.png',
                                height: 150.h, width: 200.w),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            height: 50.h,
                            width: 200.w,
                            child: Text(
                              'Earn Coins by \nreferring your friends',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins'),
                              textAlign: TextAlign.center,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Referral ID',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontFamily: 'Poppins'),
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          height: 50.h,
                          width: MediaQuery.of(context).size.width - 110.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade700),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Obx( () => 
                                    Text(
                                      homeController.refferalId2.value,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0.sp,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: IconButton(
                                  onPressed:() {
                                    Clipboard.setData(ClipboardData(text: homeController.refferalId2.value));
                                  },
                                  icon: Icon(Icons.copy, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 20.h,
              left: 280.w,
              child: GlassBox(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 25.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ImageIcon(
                        AssetImage('images/close.png'),
                        size: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
