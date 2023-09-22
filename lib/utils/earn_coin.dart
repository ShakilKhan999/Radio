import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'glass_box.dart';

class EarCoins extends StatelessWidget {
  const EarCoins({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0.sp, top: 180.h),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.sp),
            child: GlassBox(
              child: Container(
                height: 390.h,
                width: MediaQuery.of(context).size.width - 70.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 170.h,
                          child: Image.asset('images/earncoins.png',
                              height: 200.h, width: 200.w),
                        ),
                        SizedBox(height: 10.h),
                        Container(
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
                        SizedBox(height: 30.h),
                      ],
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
                                  child: Text(
                                    'relaks.media/609343IsZ.Uso90',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ImageIcon(
                                  AssetImage('images/file.png'),
                                  color: Colors.white,
                                  size: 24.0.sp,
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
              top: 20,
              left: 280,
              child: GlassBox(
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
              ))
        ],
      ),
    );
  }
}