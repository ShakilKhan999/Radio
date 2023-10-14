import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:relaks_media/controller/home_controller.dart';

import 'customRadio.dart';
import 'glass_box.dart';

class RelaksPremium extends StatefulWidget {
  int audioId;
  RelaksPremium({Key? key, required this.audioId}) : super(key: key);

  @override
  _RelaksPremiumState createState() => _RelaksPremiumState();
}

class _RelaksPremiumState extends State<RelaksPremium> {
  // List<bool> _selectedPaymentMethods = [true, true, true, true];

  String selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.sp, top: 150.h),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.sp),
            child: GlassBox(
              child: GlassBox(
                child: Container(
                  height: 520.h,
                  width: MediaQuery.of(context).size.width - 40.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black
                                  .withOpacity(0.8), // Background color
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 170.h,
                            width: MediaQuery.of(context).size.width - 85.w,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'images/relakspremium.png',
                                  height: 220.h,
                                  width: 300.w,
                                ),

                                // Add the fading gradient overlay
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(
                                            0.8), // Darker color at the bottom left
                                        Colors
                                            .transparent, // Transparent on the other sides
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: Alignment
                                          .bottomLeft, // Start the gradient from the bottom left
                                      end: Alignment
                                          .topRight, // End the gradient at the top right
                                    ),
                                  ),
                                  height: 220.h,
                                  width: 300.w,
                                ),
                                Positioned(
                                  top:
                                      20.h, // Adjust the top position as needed
                                  left: 100
                                      .w, // Adjust the left position as needed
                                  child: Image.asset(
                                    'images/RPremium.png', // Add your image path here
                                    height:
                                        100.h, // Adjust the height as needed
                                    width: 100.w, // Adjust the width as needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Payment Method',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomRadioButton(
                                      isSelected:
                                          selectedPaymentMethod == 'bkash'
                                              ? true
                                              : false,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedPaymentMethod = 'bkash';
                                        });
                                      },
                                    ),
                                    SizedBox(width: 10.w),
                                    Image.asset(
                                      'images/bkash.png',
                                      height: 60.h,
                                      width: 60.w,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0.sp),
                                  child: Text(
                                    'BDT 20.0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17.sp),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomRadioButton(
                                      isSelected:
                                          selectedPaymentMethod == 'nogod'
                                              ? true
                                              : false,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedPaymentMethod = 'nogod';
                                        });
                                      },
                                    ),
                                    SizedBox(width: 10.w),
                                    Image.asset(
                                      'images/nogod.png',
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0.sp),
                                  child: Text(
                                    'BDT 20.0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17.sp),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomRadioButton(
                                      isSelected:
                                          selectedPaymentMethod == 'paypel'
                                              ? true
                                              : false,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedPaymentMethod = 'paypel';
                                        });
                                      },
                                    ),
                                    SizedBox(width: 10.w),
                                    Image.asset(
                                      'images/paypel.png',
                                      height: 60.h,
                                      width: 60.w,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0.sp),
                                  child: Text(
                                    'BDT 20.0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17.sp),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomRadioButton(
                                      isSelected:
                                          selectedPaymentMethod == 'visa'
                                              ? true
                                              : false,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedPaymentMethod = 'visa';
                                        });
                                      },
                                    ),
                                    SizedBox(width: 10.w),
                                    Image.asset(
                                      'images/visa.png',
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0.sp),
                                  child: Text(
                                    'BDT 20.0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17.sp),
                                  ),
                                )
                              ],
                            ),
                            // Add other payment methods using CustomRadioButton
                            SizedBox(height: 10.h),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 100,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(20)),
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (selectedPaymentMethod == 'bkash') {
                                        paymentForSong(audioId: widget.audioId);
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'Currently unavailable',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.white,
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        backgroundColor: Color(0xffffEA1C24)),
                                    child: Text(
                                      'Proceed to Payment',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  paymentForSong({required int audioId}) async {
    final flutterBkash = FlutterBkash(
      bkashCredentials: BkashCredentials(
        username: "01704840427",
        password: "#ApsP+VS-W6",
        appKey: "zi7YGziyr0UadbSjjU5YGVoJtc",
        appSecret: "Ej7f0MuFG0TtQ0cdztpWXMBuI6bvVbFcLDqZcKYJHCLjGUTlppOE",
        isSandbox: false,
      ),
    );
    try {
      /// call pay method to pay without agreement as parameter pass the context, amount, merchantInvoiceNumber
      final result = await flutterBkash.pay(
        context: context,
        // need the context as BuildContext
        amount: double.parse('20'),
        // need it double type
        merchantInvoiceNumber: DateTime.now().microsecondsSinceEpoch.toString(),
      );

      /// if the payment is success then show the log
      log('123456 : ' + result.toString());

      /// if the payment is success then show the snack-bar
      Fluttertoast.showToast(
        msg: 'Success',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );

      HomeController homeController = Get.find();
      homeController.audioSubscribe(audioId: audioId);
    } on BkashFailure catch (e, st) {
      /// if something went wrong then show the log
      log(e.message, error: e, stackTrace: st);

      /// if something went wrong then show the snack-bar
      Fluttertoast.showToast(
        msg: e.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
    } catch (e, st) {
      /// if something went wrong then show the log
      log("Something went wrong", error: e, stackTrace: st);

      /// if something went wrong then show the snack-bar
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
    }
  }
}
