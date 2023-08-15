import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'glass_box.dart';

class CoinCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.yellow, Colors.black],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/coin.png',
              width: 100.0.w,
              height: 100.0.h,
            ),
            SizedBox(height: 5.h),
            Text(
              'Available',
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Poppins',
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(height: 10.0.h),
            Text(
              '1,000 Coin',
              style: TextStyle(
                fontSize: 23.sp,
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0.h),
            GlassBox(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                            height: 370.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: GlassBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(top: 8.0.h),
                                      child: Text(
                                        'Coin Details',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 20.0.sp,
                                          fontWeight: FontWeight.bold,

                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 20.0.sp,right: 20.0.sp),
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.white,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Publish 1 News',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                              Text(
                                                'Earn 1 Coin',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 20.0.sp,right: 20.0.sp),
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.white,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '100 Coin',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                              Text(
                                                'BDT 10',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 20.0.sp,right: 20.0.sp),
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.white,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '1000 Coin',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                              Text(
                                                'BDT 100',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 20.0.sp,right: 20.0.sp),
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.white,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Refer Friends \nto Install Apps',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                              Text(
                                                'Earn 10 Coin',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 20.0.sp,right: 20.0.sp),
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.white,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.all(8.0.sp),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Minimum Withdraw',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                              Text(
                                                'BDT 100',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17.0.sp,
                                                  fontWeight: FontWeight.w300,

                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0.sp,
                      vertical: 1.0.sp,
                    ),
                    child: Text(
                      'Coin Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0.h),
          ],
        ),
      ),
    );
  }
}
