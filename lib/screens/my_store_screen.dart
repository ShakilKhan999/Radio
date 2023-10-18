import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:relaks_media/utils/coin_card.dart';
import 'package:relaks_media/utils/glass_box.dart';
import 'package:relaks_media/utils/payment_way.dart';

import '../controller/home_controller.dart';
import '../utils/profile_editing.dart';

class MyStoreScreen extends StatelessWidget {
  static const routeName = '/mystore';

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.getUserData();
    return Obx(() => homeController.mystorepagestate == 0
        ? Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'My Store',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(child: CoinCard()),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50.h,
                    width: MediaQuery.of(context).size.width - 65,
                    child: GestureDetector(
                      onTap: () {
                        homeController.mystorepagestate.value = 1;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0.sp),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      height: 50.h,
                      width: MediaQuery.of(context).size.width - 62,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Referral Id: ${homeController.refferalId2.value}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 16.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text: homeController.refferalId2.value));
                              },
                              icon: Icon(
                                Icons.copy,
                                color: Colors.white,
                              ))
                        ],
                      ),

                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     hintText: 'Referral ID - relaks.media/609343Is',
                      //     suffixIcon: const ImageIcon(
                      //         AssetImage(
                      //           'images/file.png',
                      //         ),
                      //         color: Colors.white,
                      //         size: 1),
                      //     hintStyle: TextStyle(
                      //         color: Colors.white,
                      //         fontFamily: 'Poppins',
                      //         fontSize: 16.sp),
                      //     focusedBorder: const OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.grey, width: 1.2)),
                      //     enabledBorder: const OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.grey, width: 1.2)),
                      //     border: const OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.grey, width: 1.2)),
                      //   ),
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width - 65.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 50.h,
                            width:
                                (MediaQuery.of(context).size.width - 65) / 2 - 5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Publish News',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    height: 20.h,
                                    width: 20.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        gradient: const LinearGradient(
                                          colors: [Colors.grey, Colors.black],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.circular(90)),
                                    child: Center(
                                        child: Text(
                                      '5',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 10.sp),
                                    )),
                                  )
                                ],
                              ),
                            )),
                        Container(
                            height: 50.h,
                            width:
                                (MediaQuery.of(context).size.width - 65) / 2 - 3,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Pending News',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    height: 20.h,
                                    width: 20.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        gradient: const LinearGradient(
                                          colors: [Colors.grey, Colors.redAccent],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.circular(90)),
                                    child: Center(
                                        child: Text(
                                      '5',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 10.sp),
                                    )),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 40.h,
                    width: (MediaQuery.of(context).size.width - 65),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(7)),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Colors.transparent),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout),
                            Text(
                              'Logout',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20.sp),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 65),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (await homeController.withdrawAvailability()) {
                            homeController.paymentmethodstate.value = 0;
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return PaymentWay();
                              },
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: 'Insuficient coin',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Color(0xffffEA1C24)),
                        child: Text(
                          'Withdraw',
                          style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        )),
                  ),
                ],
              ),
            ),
          )
        : ProfileEditWidget());
  }
}
