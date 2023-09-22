import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/utils/relaks_premium.dart';
import 'package:relaks_media/utils/suceess_screen.dart';

import '../controller/home_controller.dart';
import 'earn_coin.dart';
import 'glass_box.dart';

class PaymentWay extends StatelessWidget {
  const PaymentWay({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.paymentmethodstate.value = 0;
    homeController.paymentmethodtypestate.value = 1;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 370.h,
        width: MediaQuery.of(context).size.width-50.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GlassBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h,),
                Text(
                  'Available Balance',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 15.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'BDT 100',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 40.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0.h),
                  child: Text(
                    'Select Payment Method',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() => homeController.paymentmethodstate.value == 0
                    ? Column(
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width) / 1.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GlassBox(
                                  child: Container(
                                    height:50.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        homeController.paymentmethodtypestate.value=1;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:homeController.paymentmethodtypestate.value==1?Colors.white.withOpacity(0.6): Colors.transparent,
                                        elevation: 0,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5.0.sp,
                                          vertical: 1.0.sp,
                                        ),
                                        child: Image.asset(
                                          'images/bkash.png',
                                          height: 25.h,
                                          width: 80.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GlassBox(
                                  child: Container(
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        homeController.paymentmethodtypestate.value=2;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:homeController.paymentmethodtypestate.value==2?Colors.white.withOpacity(0.6): Colors.transparent,
                                        elevation: 0,
                                      ),
                                      child: Container(
                                        width: 100.w,
                                        child: Image.asset(
                                          'images/nogod.png',
                                          height: 25.h,
                                          width: 80.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          GlassBox(
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  homeController.paymentmethodtypestate.value=3;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:homeController.paymentmethodtypestate.value==3?Colors.white.withOpacity(0.6): Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 160.w,
                                  child: Image.asset(
                                    'images/paypel.png',
                                    height: 20.h,
                                    width: 80.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          GlassBox(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 160.w,
                                  child: Image.asset(
                                    homeController.paymentmethodtypestate.value==1?'images/bkash.png':
                                    homeController.paymentmethodtypestate.value==2?'images/nogod.png':
                                    homeController.paymentmethodtypestate.value==3?'images/paypel.png':
                                    'images/bkash.png',
                                    height: 20.h,
                                    width: 80.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(5)
                            ),
                            height: 50.h,
                              width:
                              MediaQuery.of(context).size.width - 130.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: 8.0.sp),
                                  child: Text(
                                    'Provide your payment receiving phone number',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                ),
                SizedBox(height: 15.h,),
                Container(
                  height: 45.h,
                  width: MediaQuery.of(context).size.width - 100.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                      onPressed: () {
                        if(homeController.paymentmethodstate.value == 1)
                          {
                            homeController.paymentmethodstate.value = 0;
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SucessScreen();
                                // return RelaksPremium();
                              },
                            );
                          }
                        else{
                          homeController.paymentmethodstate.value = 1;
                        }

                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Color(0xffffEA1C24)),
                      child: Text(
                        'Send Payment Request',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
